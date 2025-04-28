Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05590185B72
	for <sophgo@lists.linux.dev>; Mon, 28 Apr 2025 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745804168; cv=none; b=p+WsS632LN4E6rYND7KO2fL/mD02AwV9uGMIxmgn1EXDFNPrztaaYCZxufN0CKGC/bDeZ+7tg+rHi6/j5G6UCyNBeWXLgF/1O0B2xN6KT5d7S5y7GOL3tuSkIy0AlF2YpFqZFFddyEA/2Wr8ZJRjTFz2Ry14xo40vcHcPhLmPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745804168; c=relaxed/simple;
	bh=RAwT+b9QULu37wssvt5BOzimq4M/z0TasiXxablI9RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y++GeZKaCQeQFAt03OyLULZNWXAbIlz+P1rSeOUsrGxYWMYqoLzIAUymAQeGIaOKSQziddj839761QYcbDgtQaoNKuftaI7f/bTPG+KWJZ6FhkHiTK8J6ZFimsJV67x1vHsY6uDPixjpvyW9XZA8wtAfiCNdYE9BDV5wygVE9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISTJ7eMv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISTJ7eMv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af52a624283so3609839a12.0
        for <sophgo@lists.linux.dev>; Sun, 27 Apr 2025 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804166; x=1746408966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=ISTJ7eMvjblw3dFa6GEWMl2IWjdUoY1W1hkYQ7Kvqjc8TFY/xofLqUDltDqs9rZsDN
         G0YeEiEAgeXejEfsuPN/Ls0ZcJDxbgyk/FIt4h5nsMguYElvKQLGxUX+KtFRm8xx5maH
         iX7De+CstJMVoC3y9oEnVCGFvgoadsyEcOEUdujcrTv3yfhSf+YhqeYOA6wAUPc4M+uZ
         uh7msA93IudgXm6gaXQk4pBhfevu2IHdML2jKTUJTK3iPCoupo0vkaEliRnb8v0qh4Po
         jO3c2DteBRuqEY4vKKem5lsitREs/LZFAUzUlZqjlugzFVL3/TSYwQTON0AimdMKj8Bv
         r35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804166; x=1746408966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1XOo3Vbbk6OtPs69iC9nG392lpAw1JpBjWZCyN3iG8=;
        b=wkPjm2tSbNQq2+3Ys2SFV/TnthPr9xhraueX4mtWCAl1osIzoRa7mGOkqHlKNi1mqS
         9fskdEjt6FcLW4C7UqmLh3tPa4bVcApQi229T2h+PsW/zCharghTiy/Im4Fs3qwVmVdH
         FMBDq7SUjvaDOo4SDRO/3n1rkpVDT1DH0rrzSOkGxr4Umy5fJsXNfgglDqYYzMgLnnnw
         WIiR6Rr0XWmyVpaegK9oPc8k492Gn3lHq0u9b+WVYK9l3d1dXTFoSUrF8ATs5H4+u4SV
         RtBU8kFFwE2JeIGhpfs8hTmTDbXPWi/lkA4uIeNtXsd8LJYF4daEgHbwxn+A27k/+CHY
         ZLoA==
X-Forwarded-Encrypted: i=1; AJvYcCV+NXXtUUoPZByi5LGr8mVP6g4SLvzU6BiYV15tieHZEaAU000msV1I2l2bxn3zFbS+Fmw/w1c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjAfFMeiUEovI7wdpgAOZ2UZSI2xtd0R7JHb1RQG9RA6CU+0C7
	ovpICpnpCVVZsyysdPHk6lDCXvpZflUg7ijQ2ebmNxEU+JY9q4Ne
X-Gm-Gg: ASbGncsqmntQe3IC6SP/vUrz86gXHz0xJCONHgOMQilAaqESRJ86zV9zsxyyjAIHPd7
	nGI1JYWIfXDXlx1mOVd49X3nQRy7U8M+hGloTrQez35TKOyjidUB6TqqC7nP/XcdeJWBQyeI1Xs
	K3Izks1l1wu10dJHqTVv71q7Q1SVJg/1qukqH1b7FXJtay8NndehESKvXROadXztj24RKYIKrRp
	5Aw3quHcIYFnTGfPVAInz5c/VoUMNFJu//1PgtgJowCNAW/ubf9F/dqew7eenBvHa4bm2jEhD3p
	aiGDcS7BjI4/
X-Google-Smtp-Source: AGHT+IHnQ1vU6MU1r9JMw0k7Ecc6KjPOryGisSgNWZ3r5gCwX8c7GY+Ct6trsj1ZnBJ9DZNBVx8LLQ==
X-Received: by 2002:a17:90b:268c:b0:309:f46e:a67c with SMTP id 98e67ed59e1d1-309f8a0769dmr14912717a91.11.1745804166022;
        Sun, 27 Apr 2025 18:36:06 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:36:05 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/3] pwm: sophgo: add driver for SG2044
Date: Mon, 28 Apr 2025 09:34:50 +0800
Message-ID: <20250428013501.6354-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428013501.6354-1-looong.bin@gmail.com>
References: <20250428013501.6354-1-looong.bin@gmail.com>
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
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 23a83843ba53..5bb92c910540 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -13,6 +13,9 @@
  *   the running period.
  * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
  *   be stopped and the output is pulled to high.
+ * - SG2044 support polarity while SG2042 does not. When PWMSTART is
+ *   false, POLARITY being NORMAL will make output being low,
+ *   POLARITY being INVERSED will make output being high.
  * See the datasheet [1] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
  */
@@ -26,6 +29,10 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>

+#define SG2044_PWM_POLARITY		0x40
+#define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_OE			0xd0
+
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

@@ -72,8 +79,8 @@ static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
 	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC), U32_MAX);
 	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC), U32_MAX);

-	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
-		pwm->hwpwm, period_ticks, hlperiod_ticks);
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
 }
@@ -123,6 +130,74 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

+static void pwm_sg2044_set_start(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				 bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_OE);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	pwm_set_dutycycle(chip, pwm, state);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	pwm_sg2044_set_start(ddata, pwm, false);
+
+	if (!state->enabled)
+		return 0;
+
+	pwm_sg2044_set_outputdir(ddata, pwm, true);
+	pwm_sg2044_set_start(ddata, pwm, true);
+
+	return 0;
+}
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -130,9 +205,18 @@ static const struct sg2042_chip_data sg2042_chip_data = {
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
 	{ .compatible = "sophgo,sg2042-pwm",
 	  .data = &sg2042_chip_data },
+	{ .compatible = "sophgo,sg2044-pwm",
+	  .data = &sg2044_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -198,5 +282,6 @@ static struct platform_driver pwm_sg2042_driver = {
 module_platform_driver(pwm_sg2042_driver);

 MODULE_AUTHOR("Chen Wang");
+MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
 MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
 MODULE_LICENSE("GPL");
--
2.49.0
