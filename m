Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD581ADC7B
	for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457919; cv=none; b=nvUOcrkCvlb/kM9cpKwxWY/LddOIX5sAoQKTyaafmVtHLObrkKlFP17spFdXNuZEgehLf74IV4LWu40NADBQVSzJZVt9mEHGJcznkwQDJHKBRxdIoUqHJvgTPWd0eFQm9nunhrR9KjiZaf2HYy//pbuGtEm++L+oaX+ofAwBv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457919; c=relaxed/simple;
	bh=KVPIWLMbsRzdhWS/MzSM6OjFjPRyaTi+mNpqH0dKv1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNJXoFl5kKdDQAChc/Ag9/DFImqufSOmAMdYi57cGI4J97mMB1l+1HM5aJ2N5RNoHOa6f8qCFI0E0s4vu5ulCTqaNvqWvZ1Jwa3lzlgamW6+8DVrpPfBwtN3JMN7gMjQ3DsErhupVVJ6ulmLMPVrGJ0n3T6XvYaEiPbEcU4BpZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA+1bGTr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA+1bGTr"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736aaeed234so356903b3a.0
        for <sophgo@lists.linux.dev>; Wed, 23 Apr 2025 18:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457916; x=1746062716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=FA+1bGTrorvYQtiEiljz8yTacyrUMOJA4shO2x45Z1/tLg6Q6RRjORAfIaTik83Yf/
         A2aSAoBS6a4ersvvCIXCmlGSIVw4Wz/Qln6OQrroHq1swexp4pxyAxFoG0DL6TOEAVdb
         Ujg3nRAoY49PdwBIhgNC7zRE9EUhN/os/UNf1ruENmQrTSpMLATA+Omj5JjPSBoHbHPR
         NaG3zzKRSm0xGtJWU9bQ4i4EwuueRHbJwA5RK9yE7dRuf4bqu3gfpDXj/3YXFjraesYL
         DsLppcYkCHcA4inBQOng3xIqLnuD6dbtqqZoQenhVh5MEYybCCXqpWTzbXsupvIH+8jA
         QWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457916; x=1746062716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHhp31roZ+6LDh1o6IeC+4GGTrHD68JTiVVSEKfH8PU=;
        b=thfjhSqlajhlxyaFR7lKGe5ENdjOndTnt9l3ucOc24Yqcmueh/JxzhTa/Fd3emteTo
         1bK+LNA2Fl0PvuEfhIOKOej63CAAw/GgchIrpWCctd63l/ZkoWWzxzK9ZYTrFmxBEWsA
         FN3BnUOercpojRPGC3tMVRe6r5a91wB00qaPMVqVh39YK+eEMriiQ86pXne05cjAfBI7
         nnuhaPzFpiDyeiomWhjEanNQDFuOcpgVvziwcyzNSAuNZ+PdqzoPH5GiOvItZIikEjSu
         nK+r2h9AR8ik2tvBpymA6/vGx93jj4JWm4g7SaGq6Q4KC/hHegPso9tUYZ2XvG3DXTbb
         v8KA==
X-Forwarded-Encrypted: i=1; AJvYcCWRicO3Oo/d8grwUHUR9tpnwl0lqTp1KJSinqk86gZjMweVEdIZ1r5TsE8hOqhOcZMW4fr0074=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoKE5EyTP6ICFR0ieKoS+BmUadF33t2gUjDmFi63n6YdBCBKKQ
	vq9NpQYy3AcDOH6SV7xIi5ZZWzt4HerxW3tDW97hgDUidsDbwjyb
X-Gm-Gg: ASbGncuFNy9AovjHFycAr7gWmn9Drbhet5ZS1m9RPg8YDFCSBK1MsipfnikqU1Savx6
	odI14+3iq15FVlmg+p8nWgTciU/6lVJCJNkIJCTAHIkkKkSgiiZWzh16jDnMRMDee//+rGCb6FR
	Yg61RPY6TkgxAzA2JzCZZdhraUGazOojUahdfnhQcqo8+bhF2ph8syyghqnB58mXYVBtc66nmeV
	fEZDqojAFVt/vVZJ6RC5dYwCdHstYe+EFkO0EgsKViQxzbU1tz3zZ9DlS5lifJwZz2p+0T64+Ot
	AW8hCp4BWOzs8e3YuVeGt8884BYQc36FW4ILvuSMRw==
X-Google-Smtp-Source: AGHT+IE2Y06oom0THOKytAAa5C8ft5qxXgEsFNfjUdq+LSQjNK7WQZeefRGGp10gDRSNC/JoSehfcQ==
X-Received: by 2002:a05:6a00:3a22:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-73e24cfa09amr1289896b3a.20.1745457915959;
        Wed, 23 Apr 2025 18:25:15 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:25:15 -0700 (PDT)
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
Subject: [PATCH v3 2/3] pwm: sophgo: reorganize the code structure
Date: Thu, 24 Apr 2025 09:23:27 +0800
Message-ID: <20250424012335.6246-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424012335.6246-1-looong.bin@gmail.com>
References: <20250424012335.6246-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the driver logic can be used in both SG2042 and SG2044, it
will be better to reorganize the code structure.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 62 +++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..23a83843ba53 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -26,18 +26,6 @@
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
 #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
 #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)

@@ -53,6 +41,10 @@ struct sg2042_pwm_ddata {
 	unsigned long clk_rate_hz;
 };

+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+};
+
 /*
  * period_ticks: PERIOD
  * hlperiod_ticks: HLPERIOD
@@ -66,21 +58,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
 }

-static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static void pwm_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+			      const struct pwm_state *state)
 {
 	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
 	u32 hlperiod_ticks;
 	u32 period_ticks;

-	if (state->polarity == PWM_POLARITY_INVERSED)
-		return -EINVAL;
-
-	if (!state->enabled) {
-		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
-		return 0;
-	}
-
 	/*
 	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
 	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
@@ -92,6 +76,22 @@ static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		pwm->hwpwm, period_ticks, hlperiod_ticks);

 	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+}
+
+static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		return -EINVAL;
+
+	if (!state->enabled) {
+		pwm_sg2042_config(ddata, pwm->hwpwm, 0, 0);
+		return 0;
+	}
+
+	pwm_set_dutycycle(chip, pwm, state);

 	return 0;
 }
@@ -123,13 +123,16 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }

-static const struct pwm_ops pwm_sg2042_ops = {
-	.apply = pwm_sg2042_apply,
-	.get_state = pwm_sg2042_get_state,
+static const struct sg2042_chip_data sg2042_chip_data = {
+	.ops = {
+		.apply = pwm_sg2042_apply,
+		.get_state = pwm_sg2042_get_state,
+	}
 };

 static const struct of_device_id sg2042_pwm_ids[] = {
-	{ .compatible = "sophgo,sg2042-pwm" },
+	{ .compatible = "sophgo,sg2042-pwm",
+	  .data = &sg2042_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,12 +140,17 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
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
@@ -170,7 +178,7 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");

-	chip->ops = &pwm_sg2042_ops;
+	chip->ops = &chip_data->ops;
 	chip->atomic = true;

 	ret = devm_pwmchip_add(dev, chip);
--
2.49.0
