Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B53594A
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988027; cv=none; b=TAtxLfStLycQ1enniHwkxjYO8AUupQd9kJ/16fs17n4I0btlfaMbXNx+CR91J8gHgGM+60epAgHISMPNQGvnLM5zZPdek1OicghXbfnINgm561ydlt5CBWCVYalYgkoyzSXBNFZB0iU9tenMKuDqOR1KLBYQX/eHVxTs6CtaC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988027; c=relaxed/simple;
	bh=MSKaRW5gafhyLiU4k0T0vTbLtjm6e2qcb4N9zV6dVtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj+3VRjRTLdJh5reJXjbkU90Jk+HeJPgq06b5+hoG2+jKYgv5EjNx6HchVxjfLyzIr0LTQ7vo685/Plan8HiSEtZQ/fVf4Dy/Ys0sGboXP61TOAKL4iDjeT/iimm/JI+x8m2aBrRtECi4lQnhcPZSoSTUaVAFF5qBBD7zel2wrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKY9FMZc; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKY9FMZc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476805acddaso47308861cf.1
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988025; x=1744592825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=HKY9FMZchaBZnEQ/AxST9wLqu4iCSpf6PiFZSa2dvXJ3Q3vxwJM7eC4U14EkP5Njhf
         P0p4K17EHsk8MGrW0umYAA3QorZ3SIzYWzuV58jtQELHZjLjSR7Y4RP6SLv3SyVqp6xa
         vMxCfSTudoA9NXZhdExT9Vzee5b8Pr/XjRcec3knbx3G8/6jz2akjgtnomk0L/crmzf/
         hh9NrlWYAhWUp+bC+qKwoIMnSc86qawZ8oSD7iJk6rWMClVTEweW/4ieVF0trN9tiX3m
         vo+/wN8w0Tc5qFQd/cHpTNH/f0/1v/hgV+2zF7F0lIMEAX0D+ymeK8kj+1zGjh+kESj4
         SXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988025; x=1744592825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vsCaRl6PH5MXOUa90IYL4ZnfxU9+wZVMbRb1hNiJ9U=;
        b=QZUk3Uvh5ag3Ppk7FwPSew0Ugn1IxBIkrhRHCI7Uc/kOeLxbJCxxa+WCA2PdCauPIV
         Zpj+rzNdKYOgysPrR//b444fMXMvyEbEo5L27iuv2w+0WwffOxcbNbCFuT4sqv3gdzfC
         TQrXjhdnlJxtxnQorc+JCJ/CQFidH1SzEnhXb2uP5Qzo8XREzpMYcOqAvtt5JzXuT21y
         Rn2ceEiaa4dy2pMOe+kTULZRZqttIY0WL7I3lr+EhahDG2g8jcvWdxdxJRVf1eqFPFI+
         5Cs9wzkZv1PpycdGsGr8yoWO4zIz2U4NkKOARYu/ksyuD+0wBhTw7CXI3kyVKw23RDmA
         khig==
X-Forwarded-Encrypted: i=1; AJvYcCVYBqVHgraKbQBksHPWQa5oHSxl/6JLvRT+i4zPepgywkrkWFtfHeg6yNUYQeIsLlBClhSYGWg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwM0NUzBFXhhdK+u085XSV313CPum6pfOtWxOJJO4UAeRp3kiN
	u5oZdjZy6nn/9gDvZInqx2/ohHOZAo+Ji7YbBFSXEJJxrcXjkCnX
X-Gm-Gg: ASbGncsSWL6/FCL3TY5goukAkmmwP+xeRVz0uUjKSFo7vvZheDvd0pr7PJYIFPAUbuS
	jZXo/t3Lk/WPkwwIQm7stF4G9nbRgJ/IQXXnHBuPsrFKoexD7RUMLjZ1ebZFOsHUkFHQhobllUh
	u6lxYo6D2u5MsvU/yUSR8ki5TsSDzR+IUKDW0IgZG3LyihwwZNcxhzFslGhhCZOLdtROj+O5kmB
	bm8jJyCUNQfWsF3pqasNcG4q8L/6DklxdGKKDEejvBBMZKNnzzoq0UkOMXKTI1fRqvOo+5KEacY
	QQYeSuU++bk6sGJ2qZ41
X-Google-Smtp-Source: AGHT+IFkuuxhR+U1DbKH3U1yTcluZAPfs3Z52K5B+BYtDKVGXg8KxpwvB9wBRVPiAyCI06NtDvnreQ==
X-Received: by 2002:a05:622a:1189:b0:477:ea0:1b27 with SMTP id d75a77b69052e-4792598f38emr165080631cf.26.1743988024739;
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b059870sm53342001cf.14.2025.04.06.18.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:04 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 3/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
Date: Mon,  7 Apr 2025 09:06:08 +0800
Message-ID: <20250407010616.749833-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
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

