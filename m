Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A51F3B89
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583766; cv=none; b=g5fi2cD3aqxsWpPesAUEvKuLmXCzEfbtKyscHhW7o5lb/ygea5c4114q27Z0aaESsHLiDDl9MAR2IYSqwixbykxU1kS8QDTolU0v+4r/5Gu+a9HzbcDwgKZAF6DuZbcit/dR4Ie/d/PQ+3/uwkbkGZvRNFS9szcRq9XLpyl4Cf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583766; c=relaxed/simple;
	bh=Z3pKjt6jm8qmltYPIKtcTmyIWWpyU/A0Zm9fLXjpxnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKCjPepOnwI7kqRReZ7Q0QUws5/XZhycB6gEZZ8cyqbyigVvkqZZ1QniZiWTeQNsz13liKd3FEKf6Gz8+Ruqzvm31ww0tziCmWshVk9FVqJNX9aYfozNgLE4G5b/IKSFE+Tysk21RRMZHmVQ5d2Pf2mSW/OdRG3O3LNj2wbLt7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbwAC7Lf; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbwAC7Lf"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47691d82bfbso80969011cf.0
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583764; x=1745188564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=ZbwAC7Lfwk/ov+K7JYcz/wXkOHKauKbPlfkzaedtBEDSVPpyjo5uSwOy18J0c0+cJb
         8zRAWkjP95MdZjitSp0LnUvwAn5Te4yAUjOxFq1/mxv6cUgStjyJi3FGir6Vn8Tzwi1z
         v/Y59XpuPpi1QiHRXw97wT5eqdk2iDw3MBpCd71412H79YSv+OsvgDRCmIWkmW3IbYrt
         vCPbBWc5BHdI4wmtHUiCbVvzW/iw3zU5dCnFjP4HoElN+PLcBalUHsS1J02erVs3hGDY
         dvTTPyQVfnubi8as+LR+9rcBdXeAi4uzEeXMMBLNkd7TxRV/Z1c6q7OIceGcFvquXZi5
         QUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583764; x=1745188564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxIhm0hMBOl2X8srvjlQ1v903Cf3zvDJK3JKql1lGXo=;
        b=dQ3zkoiF5Vo+6OFmDbKuuXjKi5gey2bdzE3JxnH/V3/QdV39U75kyNzxQq4hJySvM2
         gVwqbVlfj7rsWQDkiAxiYwjV4x8BKyFTbznOPwKfqOUc82Mcz06zfPTeNsilmPxSaRji
         sE7bk0TIjgAJbRFf0iVP7TdLt8aBnzb985Bup/5+8QM6hMYDwikhw5gRseDefxLhEWdX
         QFjqnuwpPyOpjcN8WUfSVY8Dmpwl6DmY6gha7V/1MwABtgsjU8MrmCD6nCq2MLqwtknF
         16joF+7O6M8i84hZ7PrXKmu3qlCULJmLFnJ14AYc9b+rNOSUrM18mr0ZEG5JAM1cQORA
         Yz5w==
X-Forwarded-Encrypted: i=1; AJvYcCUAzZLtBGtMWp0WI7OlYwA09IPkTyuGXZL+Vmjom1+n0n7exMRz7zOxkuviAetz1vdihNNEvxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YySaXNU7zzDcpeP3BlWshmQ/BuWodza53WJMfCPPSK3sciRLQQK
	6+5GmsXvQArn5NADgO2klXW9/SvLH9CHQjl7MngSS6GJsS6SSeL2
X-Gm-Gg: ASbGncvXJyttWS5Yd5MVAPAA83nSIumkBAyhZlynMKL6I/UUry6CW7krui3+CdyQyJQ
	+0qk85Vz6/W1Qsg31TRODBBrrHlaO1G9mv+2W6juA6g41HinIX9naP3o4pYhRot9+NmM61/ISi4
	T/XZvt9/Ok0D8dSrsqy7pDcVu3p3DZ266YxB1MMzHEZdSKckvADlD2lHejKaK6v4OaZP03VMubD
	jsr/rtUePW8OawAfXAKYIAQThHldfgftoNOYiuQ4UCMI0VC26fX60Y0mAZIAH09wkD6xG2fIfu7
	kWtdgFLNYvsU8HAR
X-Google-Smtp-Source: AGHT+IFo84woRciVkAQ2hF3obX7SVl65Hj+exFcnkwrsEEvc3GWg1aGSkIMkZ1v62wMhkdyNDFHSrw==
X-Received: by 2002:ac8:58c9:0:b0:476:60a1:3115 with SMTP id d75a77b69052e-479775d355amr169052091cf.33.1744583764114;
        Sun, 13 Apr 2025 15:36:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796eb2945bsm61605741cf.32.2025.04.13.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:03 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 04/10] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon, 14 Apr 2025 06:34:58 +0800
Message-ID: <20250413223507.46480-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2044 implement a standard T-HEAD C900 PLIC, which is
already supported by the kernel.

Add compatible string for Sophgo SG2044 plic.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 3dfe425909d1..ffc4768bad06 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -70,6 +70,7 @@ properties:
               - sophgo,cv1812h-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
+              - sophgo,sg2044-plic
               - thead,th1520-plic
           - const: thead,c900-plic
       - items:
-- 
2.49.0

