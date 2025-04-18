Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE6267B98
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943440; cv=none; b=nfCK9JuBNcKZnSggGzvw4aVRpKtwhqJqf6Xr1H7or5rMpx5xYZddK7Nw4PsZ9aljiDGmO8pCp+xygJg3fgEoAUV2lR3RxhQ395XFeG1qdKRnWLnkcVtMe0kwvuTbbPfK1SrAk2DXH76nZBJ3soy7A28brgh6gOliorFMf/jzLOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943440; c=relaxed/simple;
	bh=F5wTWiuzfh8Tt2PQ9yfbi0SFEuZODRRM9Iglxqr2MVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs1/DVvSLJdHRp0d0v2KpcPlPSn4fEoiJXrgEnufoAi9aOc/qcCTs5bTsx7JkMxKV9R25hfWRxRSefMlc0/nPd61ZFQ/FP6B1APg/tloUzJK7gaxSXH96F1RH+xsfEIPu8d3wXl53lTVWOX4OAgowrHy4+uBQ45HtE7WC06EHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJmxNb+k; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJmxNb+k"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2279915e06eso17337665ad.1
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943438; x=1745548238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhyHi9uQpRULTwQZULLja3qU3XsixSmtudhV3coPhWg=;
        b=nJmxNb+kAFk4GksXO4wtniBhxtQ0cP5D8vrKgAoehGfbzgg9ztyeU00LC9XJZ3tgyY
         Gj3L6qsluBkEIbSwF+q0uI00lvEH7siO2Kk21fRyyXILVNkqpw85sPaEx/OoY9LrJGpZ
         4e4euvb24p4QUId8xcDCrkov5GWd0LeWR1uEVkyTNHSfiTpxS+MQgLqB9STjHXUpRn9z
         eUXwOslstPbWn3b1XNte+DnSkH7RzmEFBJnuBkPfowECXYAlogB7mk5LZOEm1hyRac9i
         7DubfiF4yHxcOHQhQubrHuIrCPuPgd0rW94fOYQ3xvYZyXUEYiWY6U+BhhKDnf6mQrxU
         Jdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943438; x=1745548238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhyHi9uQpRULTwQZULLja3qU3XsixSmtudhV3coPhWg=;
        b=WgWk9kJdpsD6pf+yO1GMpUEJoZUgs12ApPc9DwL3+2fUf10XIE00a4hRUrtitPnLRZ
         skkWXJjbg5UMFvn2EH10Z5/q4c/FYBD5uhvtgAoCNVuiUzBqV4uJyU9xs5T7tgMj8g6q
         uRw8aYYmjlCru2ixgHYBpBLsv39h8VVT9sIMCNh9z5YgS43jnytDUWEAGDr0OLmCcttH
         1i3m8B1sKaUVLlu4UGET18IAo4j7K5XFDaYEvYHS43ezdlniCkuiTAMajjxdQ+Am01c/
         k+asus3XtUsRpQQeZV3zMdMPqOOdzj4O068/CI6/H7BrpM1mUrlcSOwxCSAvrRx7lheP
         vs4w==
X-Forwarded-Encrypted: i=1; AJvYcCV4YL9wszqzSqqj6zt/KyshmcX1ETzK/VHaOwdmcaS8n3E3tdSbAQBm5I48vFO+Be0zQqOxyMs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu4g0xVG3Gn0IXhSG9YrYAbsfZ7dg/94DQnSil+mqVCht5Pgya
	f68bb7htS3Nd6svJrHIKB9t7Ro0L83Ozd74jbSFEV50KE+gnEu9R
X-Gm-Gg: ASbGncuAmz+k+zjMbqLKbK0dwvZ51hNsNzy0Zh0/hacmz5ETX4U4YwbHfPtAg/w9LGA
	DvAA/VIhCrg37eB3sYhNKN7ilwoSgCQtoE7M2UX/18TbkS2fo9Gf7J7HBUiKy04kR6Z3ATRZaBu
	Nz1IIhV49IUfQExkBk0mr5zn717D2E3NWKYX32bF4umL0Nkl80VLvT2TnqXUj2HXZ5aFRFya5G0
	OVjgnRTDDTIBnyoDK5FtABgE816JE7z/ux11asyhvZsnol0eiBmPEImnjrSzHrmtt+PqJZ+okeN
	idLHt1A+XQY9wnJf6fsh7rjSO8w1C123zTQ=
X-Google-Smtp-Source: AGHT+IHo/o4KQhGB66PuErDoqro0sabaeHOL40TB7KoY2oAF3V05eK3U8JRd5gLiVCzL4LU7JUlRpw==
X-Received: by 2002:a17:903:41c7:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22c5359b5damr16046695ad.13.1744943438447;
        Thu, 17 Apr 2025 19:30:38 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:37 -0700 (PDT)
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
Subject: [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Date: Fri, 18 Apr 2025 10:29:46 +0800
Message-ID: <20250418022948.22853-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418022948.22853-1-looong.bin@gmail.com>
References: <20250418022948.22853-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PWM controller for SG2044 on base of SG2042.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 23a83843ba53..26147ec596c9 100644
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

+#define SG2044_REG_POLARITY		0x40
+#define SG2044_REG_PWMSTART		0x44
+#define SG2044_REG_PWM_OE		0xD0
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
+	pwm_value = readl(ddata->base + SG2044_REG_PWMSTART);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_REG_PWM_OE);
+
+	if (enabled)
+		pwm_value |= BIT(pwm->hwpwm);
+	else
+		pwm_value &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_PWM_OE);
+}
+
+static void pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				    const struct pwm_state *state)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + SG2044_REG_POLARITY);
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + SG2044_REG_POLARITY);
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
