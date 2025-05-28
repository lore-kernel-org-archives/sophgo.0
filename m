Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC527A12D
	for <sophgo@lists.linux.dev>; Wed, 28 May 2025 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427145; cv=none; b=D4CAkbr6skYvlgoryhAR23ieORYqDWs8wz59n3m6bgqxIuCfRV4wHlyrLQnsRqRzmqz9ND61l7dWKGMCY01cnQOLYFiuXOgqHjltddkZy1Wmi1VNP2fS/ug4sd9+HKSkJtKKx5CO/DzZh6miZ4p4+Ef8/PxYu+W0HN+CiLu9Pi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427145; c=relaxed/simple;
	bh=xr9G46dj58Ks9R2hFHMEyGZQjQDhmexVHbnzDbFEwVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si+iRYvZh3LcDLzem/zkSZXIduyStW9ZfmqQkVrbfnpbIzf9N9UftoyX4ZbMGBNThx035ahMrAjEe7Kt8XknRPpAExjcX+O3759y4EryEZKtNEeK4Mpede8W4AwOrMly8k+Q78mtXle3oK1XFIVWddqPdzd2KoS4pPYvi7x/bc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaddD/Yt; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaddD/Yt"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7353779b10dso2229477a34.2
        for <sophgo@lists.linux.dev>; Wed, 28 May 2025 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427143; x=1749031943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9UzaJZDvKRNmn4BJ2b4hvJbdoSm7qg3xJXdaBQvCs4=;
        b=HaddD/YtKHXXMVCErTGGBIVifYVZ0mSRvPkNZ58umRKMqCfjCsGpclY3PBS2NeYkfs
         r0FgaE4CzG8pvckg4LctOcoQlf4oRXXxM0Cwj/xcfj6r9LVLDwNlW0EhIBZbtGmfMPIE
         tozXp5cJ5kNzIezxn2Q35MEIgkP91Z9ZHQ5WRYLSwAOuYlJgu8HHBryOxes9BDJ+BWOT
         SzJT6CSHo9nq/8mv7yq5fVszZFAOjN8VRKTHTgGvjDixUrC8EPKnonijsd8HjBGksQRn
         R53FwUd+iOauY0a7r14ivGEinosHQ+RzLW/cD5tSEnefuArTtem4jB7pWPxK/cmP/ihV
         TyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427143; x=1749031943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9UzaJZDvKRNmn4BJ2b4hvJbdoSm7qg3xJXdaBQvCs4=;
        b=iq+mjxmG9vERVLEz9/ZfCCIiFsdVlf8sHeOyh+3SLl1ySOVD/Vt1DTxS3J5W7NFG7R
         O6bdTUD43+M7J1Pjk6XuCm8btULKZwhlGSwIqwrm9oOtIdC+OiINGfQJVFXK1ruD394J
         iLm374f8zx2GgmFCADg/aAJVE/zo9R4jcdMiw+h49ScK27PM4EeCFJhUFo3mqffa4pz0
         dtPOO0ioefyjqy8O+uS6QT6Cr3ogOj7oP2a2frZCbt8xfUU+dt6cTNPpq3cRSOBbLWMK
         soomJeTUaPiRUtrBRjP5T3R7kJBWjR0h/WMEKuPf5YdyWLqysGgougRTsfDjPX/+faJk
         TYOA==
X-Forwarded-Encrypted: i=1; AJvYcCUtx7uluMcANd40e3YQJBpI198sJFymPXn/LwBYqXOJpVbsAP7bW2TovDwM9k3Wo6T3QirVOLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL4b8we5g/W92sdzJP4BwcdHUzNj3+mcP8vqA3By9eUw0fPNnA
	pjeQyCR1ATJHUJztcqiLxlQ7azbwvL1qkRFs9/JqpPd2MXs+k61Cawdck8780A==
X-Gm-Gg: ASbGncsqRmRcGS4sx52vUvdqHrTZA3r0wBk+7vj3yOEbSKSFBz/fvrpd7tz1w/HurX6
	oolpgRGdEKQLyulfUyJXRqqhDCx/83ku+nzwZBiPgcrpUT+5iK/4q9MVXYFbiSyQw+HW0AZNAk/
	hsVdcwggsDWnAo0Y1CbKR8NsAdywWqtI3HOunvHw8elhNfesHPG9mKq97kAvohDtYfkiz9Fd4Nb
	MTrkKc9WGHLeb+2IsK2MyiTjFHpb3yOr2dL69sU5CEh2SdTM2NrQIQ6utvWlRBxXM5faMDByMma
	DHU5dRX2h4kbcVmsF9+tXkmMgmvvw4N20G3JLBH9VaJLLg==
X-Google-Smtp-Source: AGHT+IEjHqDXErb8LHY+YXueka86+j+atlpa5otAATrNzDLyo6C+uNeLDmOMpvofRqGSXrlPBv+XBQ==
X-Received: by 2002:a17:902:f544:b0:220:c164:6ee1 with SMTP id d9443c01a7336-23414feac2bmr246739315ad.32.1748427132449;
        Wed, 28 May 2025 03:12:12 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:12:12 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Date: Wed, 28 May 2025 18:11:38 +0800
Message-ID: <20250528101139.28702-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528101139.28702-1-looong.bin@gmail.com>
References: <20250528101139.28702-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PWM controller for SG2044 on base of SG2042.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index da1c75b9c8f5..d71d2a66b722 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -13,6 +13,7 @@
  *   the running period.
  * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
  *   be stopped and the output is pulled to high.
+ * - SG2044 supports both polarities, SG2042 only normal polarity.
  * See the datasheet [1] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
  */
@@ -41,6 +42,10 @@
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

+#define SG2044_PWM_POLARITY		0x40
+#define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_OE			0xd0
+
 #define SG2042_PWM_CHANNELNUM	4

 /**
@@ -84,8 +89,8 @@ static void pwm_sg2042_set_dutycycle(struct pwm_chip *chip, struct pwm_device *p
 	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
 	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);

-	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
-		pwm->hwpwm, period_ticks, hlperiod_ticks);
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
 }
@@ -135,6 +140,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void pwm_sg2044_set_outputen(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    bool enabled)
+{
+	u32 pwmstart;
+
+	pwmstart = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	if (enabled)
+		pwmstart |= BIT(pwm->hwpwm);
+	else
+		pwmstart &= ~BIT(pwm->hwpwm);
+
+	writel(pwmstart, ddata->base + SG2044_PWM_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_oe;
+
+	pwm_oe = readl(ddata->base + SG2044_PWM_OE);
+
+	if (enabled)
+		pwm_oe |= BIT(pwm->hwpwm);
+	else
+		pwm_oe &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_oe, ddata->base + SG2044_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_polarity;
+
+	pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_polarity &= ~BIT(pwm->hwpwm);
+	else
+		pwm_polarity |= BIT(pwm->hwpwm);
+
+	writel(pwm_polarity, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	pwm_sg2042_set_dutycycle(chip, pwm, state);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	 pwm_sg2044_set_outputen(ddata, pwm, false);
+
+	if (!state->enabled)
+		return 0;
+
+	pwm_sg2044_set_outputdir(ddata, pwm, true);
+	pwm_sg2044_set_outputen(ddata, pwm, true);
+
+	return 0;
+}
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -142,11 +215,22 @@ static const struct sg2042_chip_data sg2042_chip_data = {
 	}
 };

+static const struct sg2042_chip_data sg2044_chip_data = {
+	.ops = {
+		.apply = pwm_sg2044_apply,
+		.get_state = pwm_sg2042_get_state,
+	}
+};
+
 static const struct of_device_id sg2042_pwm_ids[] = {
 	{
 		.compatible = "sophgo,sg2042-pwm",
 		.data = &sg2042_chip_data
 	},
+	{
+		.compatible = "sophgo,sg2044-pwm",
+		.data = &sg2044_chip_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -212,5 +296,6 @@ static struct platform_driver pwm_sg2042_driver = {
 module_platform_driver(pwm_sg2042_driver);

 MODULE_AUTHOR("Chen Wang");
+MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
 MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
 MODULE_LICENSE("GPL");
--
2.49.0
