Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDB1F63D5
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583783; cv=none; b=Cfxn9R87qQ3GZxZzCnFohAbB1XEVpy2mSZeoe7zmn8bpUSf5mKmPYPNxEr9WnD5fti6RSnCRngn3zfMQEsQpp2BySUvk/AGP4IM4KdM4anPB6RddRTCEJ7k9fMGdYx+UY/arbJKqZEHeU+43w/hFiY+eaWAP20tFZd4YCrMeqFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583783; c=relaxed/simple;
	bh=iQhEhvtWreTKjDgVMOLNuvuoP3LvWPCieVInBZgjSEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0eDTqrE/ye+1wSVyFRe2bCM+K6lQDWnS2XWDOcMtFBWBzmNQpT8bRnikF7ya6rKK0wCFvy9N0Q8kdBqeONrEPsu9TrisKsOiFWq0j3F7I8UZHqqUHK38Gf3W4wklEGexfO+Eib/9PnaobS9nahfV+VJT0h33Io3dGFe3PbkUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U551EnfD; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U551EnfD"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so40243116d6.1
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583781; x=1745188581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=U551EnfDs4eoWHcQsGZoMvhVWaKPJtELX4845QQTLbekEyF7Bg6cmYyCekcSdb5sYW
         7LmwAfNWsMzZjStybH1gGwmx5zku337K2n0ZomqBg2oJbuuNEenCnLfSJpwTx1r6F+gR
         CrLt8eb1MAsQhtiJquNB7yoe2uVxqiv25y1+2RvSsyji3ZOo1haqcG3rMCN3fRLKiYz4
         z35F1ZyNJczwM3hlu1+05YKRl072DBp+hAowbWmeuK+JLDs8kD0cUs7DB6ciQWXPmXVe
         V1G7RIIqbwn4rMVJoYHqRRRVCv4lit0L9Gad+ulqiWSWMQTawvYkSrM3l78dQeH6h4LX
         dRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583781; x=1745188581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujvrsKKJBm/oWRSDuVcF1H3tb7POrXpYuyY0zyS12hg=;
        b=OpMqVkXQpVZQIWh+ggTB/5uor3EJBLzeShx2NgzWMfknIGV0vYZe/UTh+r4Dojx9QV
         +zCElvTa2QpOqT/rODIrZd5jexO3+aiuLpRfx0Ile68C4wBKmb+QDxAuTfbRv0xtHLER
         egEWqD9GQiG0OV852ipZLMaGYYkk1ih+2WwVOvUqpgZ1bSLHlvlzVPkjO2thVMjYSbEn
         scVJxUTUmnbn3a9KWeNqRcz2U9cQDZ8Sp4o/LsKmn/gPk9N9FbrpylMIaWGAWkYIAU7f
         YCdzxTg1c4/sJlwtKpHcH7dC3D+LrYLd3aDX7zoH+6r/xW39tklnrMPTPn+CaoPyqo/V
         Wvwg==
X-Forwarded-Encrypted: i=1; AJvYcCWl5d9ai4mAe4QnlEIewT33Uohcx5ARTg6UAM1vC6a0SmjwEU5npDgLBdOw074aG8mXsJCvNr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCDjis17rZWi71fZ6DikkSF6avD+DHnIPFrWDFQUlkyjegQ3if
	WD4qSBgIZQHaE1jXGCZ0QqJpMOfKZL/FlSw2U8RBkALvd/289gAL
X-Gm-Gg: ASbGncsIAW4m7sxw8wpahCPnffO1ZqdkDCeEKNeGA1jGhmNqv/zISU5MuWCEsQ1TULC
	doX56/F1dFtjkDjcZA8///I0xHcxA/I2B2Eutq77fPfdApD5j8gUOVY/Bcnl1F9hStRHXvwtRtC
	aX1LR2mSlGKL9fwAu4mJeDgiz6k7D3Q84LOQj0JZgcg5KeswD1ft826qyBt949btDFiw6seyK9u
	U8/5eAaRee7/wqw5j/s921L/4K5n0ch17kWxBV8x5GnWR1CiCnym0ZUFkpBc+OCKNeeZjFegtrP
	Cz5FFgG85yCLMg3E
X-Google-Smtp-Source: AGHT+IG/MwghfEhc97YvFHZWLozw9xlagqWPjSNN/9ACmR9MjI4Awfl/moCJE8mwkkuxdSflay6C9w==
X-Received: by 2002:ad4:5aea:0:b0:6ed:18cd:956d with SMTP id 6a1803df08f44-6f2230c7614mr156245706d6.22.1744583780708;
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea10755sm71031576d6.112.2025.04.13.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:20 -0700 (PDT)
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
Subject: [PATCH v2 09/10] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon, 14 Apr 2025 06:35:03 +0800
Message-ID: <20250413223507.46480-10-inochiama@gmail.com>
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

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..b4c4d7a7d7ad 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,pioneer
           - const: sophgo,sg2042
+      - items:
+          - enum:
+              - sophgo,srd3-10
+          - const: sophgo,sg2044
 
 additionalProperties: true
 
-- 
2.49.0

