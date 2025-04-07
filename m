Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0CF22DFAD
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010529; cv=none; b=UIbcSB+vNei3GJbBWxP9hYwP3duVe3BaGNh6f8Rq1Uzt2MHcnojPSL0VyFlXRFMElpEUgn7ntvaHkq151qWqFFRpOeJRptR9DkHuc4CkrOI8oYvmvfqX9VyFGAhjdEQQHngmACmYhktDJaAGHrHTMvY8nhilCaYr/Q1rqzmwRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010529; c=relaxed/simple;
	bh=4bpQaaZYT3oOYOMoscQm9Fkt/EmHq0F2jKOLiMaZtfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRszMnDD38TIkdxF7NCbsd3RC/8wEHfFN5tO3uBlB+SeAoNTXQUcT5Lq7z87C72dHL5xkRFbQOvRhgZ+M7ewy6ZxpeeaIqcQsQUzo0fwSm/CTELnebfTDXq4PwIXUOmpj3WgiBVJDofhuFvJUfzGL+70kSwJVLYvhnxlj8AeQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCwRcSUT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCwRcSUT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399838db7fso3387143b3a.0
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744010527; x=1744615327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtPLSSpf2N4lxDacHDhTtYSx49Qgr/ixS+pBrLkhkxk=;
        b=PCwRcSUT6ywGsJATR7yuBsYAj9FQDAPjvhH+6ViYlZc83weHvvMQMHOM9MBWauklZw
         U3d26Tb+DYVPGF7KiI+2L9xjZj6yy2XVT6iisONlsJLinEpwaFL4NuHBvf/ubTvZRWwn
         SuA6Q/5zmsU+aeyZqG9v9VIY8TZaoIwEa4YtxvsCenHOu99w46YM8c1JQMmRWfyks343
         d/FEoCe+xEJGCQN9GODWrwJ0BfxUXotBb2aXG6NRhbGk5EbweSfN/9+9N4A2O59AqLcQ
         9yKd0pJYS0n3CZHM8BM3eZVT3SGQ/UlRafNLunT37xrpOq50fP0qu/UbvbZGuN8+gbBy
         jk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010527; x=1744615327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtPLSSpf2N4lxDacHDhTtYSx49Qgr/ixS+pBrLkhkxk=;
        b=PL0wQEjh3ZdXCncNjaqg/hHjxzJON0j1xzD+ySQ0T1Fn/LXhAyxXXYXhW5cMjcPP8q
         /v0UOUbUExY9TuyWLBFt0ocKbNjr4HjD2KHUt1djAX+mH9BXpA/uAxMyOa0igLtgQnv6
         1KKc76pv9DoF2dn5pu9AkdSRusM6rDT4CMRTrjwl60pK7eGXVsq+snkeyZVVNrDAWCIl
         +VYPdihemRtUtVmhXgR3+iSZJImKVTVNzTy2QLCLBkftytqJShzfNIcWkkalVjy44Uft
         KCwSOZMvu/dZOhV+IpsgpOKNtIx5Ulb/IUWDj9uwxcARhocq/5k/VE3jyr42eOSZCNkD
         KN1w==
X-Forwarded-Encrypted: i=1; AJvYcCXp1PHMaAfAkiez5dziRXe6BqVqD6ifcZh+osHUzMCBQnqER17zGWqH/JrZqyTSS1M3eyVFCjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTJoouqFglPZTz7KOAsNV2Z1GkwQnMcqQPoj/QhT7rnNYQmyvB
	U9G9AxqMN3ICy/UZaOF/iDp9u7pfdQWTrpQIIudBZj3FnGOMB1ixjIClWm+k
X-Gm-Gg: ASbGncvC6K0seXsO4o4MJ14fbGqCTFfRwl2l1sF1NMzh4RIGRVkthnfuYpv4280AaUN
	2+Rb0KL/+GtRmLJ/H8j+SIgBMo4gYCWvt109tGDjP6bGO05q/NGf6jMy892keFsUeeh4OaiFE6+
	F3PSN834n+a8YdJJmiIIq1lW5hSV1avXGOQoQcnn/u91dqfMMzkgrB/ZmIgu2uY8IL4Q3znclAn
	y3bAXFL2KFLeL1XaE+bLH+98wHPBVnTiKRV4X4s6xI1xhpJBum5ky3WIgbejvAWTj6fsbbfTFcG
	NVgPAADlhawjFr+XAtdtu2gi+4C4+Q==
X-Google-Smtp-Source: AGHT+IG6YjWDOoFfhOGabKSmYQA7ynJLnSYcujy3BxyjgzRY/wLB59ZJTu6yaZ1zWezt6WLB+UnmOQ==
X-Received: by 2002:a05:6a00:ac4:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-739e5952278mr16715502b3a.5.1744010526532;
        Mon, 07 Apr 2025 00:22:06 -0700 (PDT)
Received: from cu.. ([199.182.234.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee60dsm7787598b3a.40.2025.04.07.00.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:22:05 -0700 (PDT)
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
Cc: ghost <2990955050@qq.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] pwm: sophgo: add driver for SG2044
Date: Mon,  7 Apr 2025 15:20:39 +0800
Message-ID: <20250407072056.8629-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407072056.8629-1-looong.bin@gmail.com>
References: <20250407072056.8629-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ghost <2990955050@qq.com>

Add PWM controller for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 162 +++++++++++++++++++++++++++-----
 1 file changed, 138 insertions(+), 24 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..c62e8c758d87 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -26,20 +26,22 @@
 #include <linux/pwm.h>
 #include <linux/reset.h>

-/*
- * Offset RegisterName
- * 0x0000 HLPERIOD0
- * 0x0004 PERIOD0
- * 0x0008 HLPERIOD1
- * 0x000C PERIOD1
- * 0x0010 HLPERIOD2
- * 0x0014 PERIOD2
- * 0x0018 HLPERIOD3
- * 0x001C PERIOD3
- * Four groups and every group is composed of HLPERIOD & PERIOD
- */
-#define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
-#define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
+#define REG_HLPERIOD		0x0
+#define REG_PERIOD		0x4
+#define REG_GROUP		0x8
+#define REG_POLARITY		0x40
+
+#define REG_PWMSTART		0x44
+#define REG_PWMUPDATE		0x4C
+#define REG_SHIFTCOUNT		0x80
+#define REG_SHIFTSTART		0x90
+#define REG_PWM_OE		0xD0
+
+#define PWM_REG_NUM		0x80
+
+#define PWM_POLARITY_MASK(n) BIT(n)
+#define PWM_HLPERIOD(chan) ((chan) * REG_GROUP + REG_HLPERIOD)
+#define PWM_PERIOD(chan) ((chan) * REG_GROUP + REG_PERIOD)

 #define SG2042_PWM_CHANNELNUM	4

@@ -51,6 +53,12 @@
 struct sg2042_pwm_ddata {
 	void __iomem *base;
 	unsigned long clk_rate_hz;
+	struct mutex lock;
+};
+
+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+	bool atomic;
 };

 /*
@@ -62,8 +70,8 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 {
 	void __iomem *base = ddata->base;

-	writel(period_ticks, base + SG2042_PWM_PERIOD(chan));
-	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
+	writel(period_ticks, base + PWM_PERIOD(chan));
+	writel(hlperiod_ticks, base + PWM_HLPERIOD(chan));
 }

 static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -104,8 +112,8 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u32 hlperiod_ticks;
 	u32 period_ticks;

-	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
-	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
+	period_ticks = readl(ddata->base + PWM_PERIOD(chan));
+	hlperiod_ticks = readl(ddata->base + PWM_HLPERIOD(chan));

 	if (!period_ticks) {
 		state->enabled = false;
@@ -123,13 +131,112 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

-static const struct pwm_ops pwm_sg2042_ops = {
-	.apply = pwm_sg2042_apply,
-	.get_state = pwm_sg2042_get_state,
+static void pwm_sg2044_config(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm, bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_PWMSTART);
+
+	if (enabled)
+		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
+	else
+		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWMSTART);
+}
+
+static void pwm_sg2044_set_outputenable(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+					bool enabled)
+{
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_PWM_OE);
+
+	if (enabled)
+		writel(pwm_value | BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
+	else
+		writel(pwm_value & ~BIT(pwm->hwpwm), ddata->base + REG_PWM_OE);
+}
+
+static int pwm_sg2044_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				   const struct pwm_state *state)
+{
+	enum pwm_polarity polarity;
+	u32 pwm_value;
+
+	pwm_value = readl(ddata->base + REG_POLARITY);
+
+	polarity = state->polarity;
+
+	if (polarity == PWM_POLARITY_NORMAL)
+		pwm_value &= ~BIT(pwm->hwpwm);
+	else
+		pwm_value |= BIT(pwm->hwpwm);
+
+	writel(pwm_value, ddata->base + REG_POLARITY);
+
+	return 0;
+}
+
+static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+
+	if (!state->enabled) {
+		pwm_sg2044_config(ddata, pwm, false);
+		return 0;
+	}
+
+	pwm_sg2044_set_polarity(ddata, pwm, state);
+
+	/*
+	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
+	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
+	 */
+	period_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period,
+					       NSEC_PER_SEC), U32_MAX);
+	hlperiod_ticks = min(mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle,
+						 NSEC_PER_SEC), U32_MAX);
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: PERIOD=%u, HLPERIOD=%u\n",
+		pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	guard(mutex)(&ddata->lock);
+
+	/*
+	 * re-enable PWMSTART to refresh the register period
+	 */
+	pwm_sg2044_config(ddata, pwm, false);
+	pwm_sg2044_set_outputenable(ddata, pwm, true);
+	pwm_sg2044_config(ddata, pwm, true);
+
+	return 0;
+}
+
+static const struct sg2042_chip_data sg2042_chip_data = {
+	.ops = {
+		.apply = pwm_sg2042_apply,
+		.get_state = pwm_sg2042_get_state,
+	},
+	.atomic = true,
+};
+
+static const struct sg2042_chip_data sg2044_chip_data = {
+	.ops = {
+		.apply = pwm_sg2044_apply,
+		.get_state = pwm_sg2042_get_state,
+	},
+	.atomic = false,
 };

 static const struct of_device_id sg2042_pwm_ids[] = {
-	{ .compatible = "sophgo,sg2042-pwm" },
+	{ .compatible = "sophgo,sg2042-pwm",
+	  .data = &sg2042_chip_data },
+	{ .compatible = "sophgo,sg2044-pwm",
+	  .data = &sg2044_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,17 +244,24 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
 static int pwm_sg2042_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct sg2042_chip_data *chip_data;
 	struct sg2042_pwm_ddata *ddata;
 	struct reset_control *rst;
 	struct pwm_chip *chip;
 	struct clk *clk;
 	int ret;

+	chip_data = device_get_match_data(dev);
+	if (!chip_data)
+		return -ENODEV;
+
 	chip = devm_pwmchip_alloc(dev, SG2042_PWM_CHANNELNUM, sizeof(*ddata));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	ddata = pwmchip_get_drvdata(chip);

+	mutex_init(&ddata->lock);
+
 	ddata->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ddata->base))
 		return PTR_ERR(ddata->base);
@@ -170,8 +284,8 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");

-	chip->ops = &pwm_sg2042_ops;
-	chip->atomic = true;
+	chip->ops = &chip_data->ops;
+	chip->atomic = chip_data->atomic;

 	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
--
2.48.1
