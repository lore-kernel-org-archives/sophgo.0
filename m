Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24031AD23
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943433; cv=none; b=bVgBZ615De56XTteq4d6xz2kN3Oge+YEmz6sKJ8cNsTDoo3QcCHBCoNzodOrzH+XuASvsffPirwJcJ/tY6ANJW8AM11RA3X19uiJIjpOpCMKMvGJWq9uzeNDOYAldQspDWxUIBw7Rf17Vx5jEXMUdpOKNjVDz82m/AfxRuaxOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943433; c=relaxed/simple;
	bh=tMjTIJgmJCvCZE08QgjAay18aUqAwDfxjinPV3iZzg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndV5UtA4/QSVnzs2O5BC60yEuoby3wUIA+l4XeTLY3r8Az/oZ+p1TjgizTWoTLfyRsi6vmNQGP1IwTY3XkTl5ir+cumTTgNfxFpJz+s2hMM65YnbypUMTKeyFzeh326JAnW7y2aD1vMpyKbwQ6riOSI+jrTXvTUwxMlPINI/TCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEpfobBv; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEpfobBv"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so1298262a91.1
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943431; x=1745548231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7xED7gAs7WHbJVjZWFN0lIu8Nx3/HGwmoPo1V9lNaU=;
        b=CEpfobBvcoQ93J3lbSh++udxLsYResCckBYoyKncTwXxMeKJXOksUtN8vYK04P3lia
         P1rkPa+maqgDoECD4Kvz3WmXU8fwGupCEPaB7lpeQmUW7nOdE47n7OVibKASW618Lh6Q
         gVVOffEhGt8wBuD1skqVFYuVkR4mMLYh42hD3xzFOn4kOZAUXx4JWdOk2E1Urzu2l7gR
         r61wV6TlL1nnDSzUIcto95O/iqfORLOvwbGWN7gmz45uVOAUP1HiZ3oSzpTNSPqHTAhZ
         S5GM1QoboHhwfaXILSE9RPxJU8EV5bQWI0r5w/aduFkRTPT/EhuqXJKdJchlE/RQj79B
         fOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943431; x=1745548231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7xED7gAs7WHbJVjZWFN0lIu8Nx3/HGwmoPo1V9lNaU=;
        b=WRhLbWt1FBPNlYW8cNjBHhXJWmU2ceDm9fuVOPNq0fs6MVpBzxjDDVDMFp9JCSEC/b
         ppAQEwQUpDesX+GmExHGkmlmLeLX5lrJTugK7O8ppyXhODyzFCo3lWSs5PCsQXf55+gk
         5orPbZ1Qob4QGIb1YTM/mXmnNzLDP+0cVUoYIEvGqA3W/XKuWSt7i5t7ByDoQvGI0iGN
         7LivObtxhtXlfGl6k+25fE+TzxBfeiNq65PfivegrFvZ7zCgulhY5cwI6UdUJ81H2oRv
         SReGheZOlBfuLZ0Nw/kCgPyicSaeJgVFBlwK+rZf5vxSqSZvvpJC+mh1yh9umeuFOFPx
         T8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWj/mWiQZMnv6ptA7i7XsKrNCEd/t1WaALcqCPrKULRa+Kbh6kIlOYLeHpOCS0bMUoHOpqIRC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOm5h+Nf1Ek8az1NtDanzfOPbeqqZw3ZAPzlwJ4pi01ZG8S9k2
	4ePIt+RpeKk+uNCu+IquPUQYsYeT8AS3t5m2FbOSEk1YFq4PYDAC
X-Gm-Gg: ASbGnctiGgfmz11m0NWm8DFeudCWTLK5SZlFpstP/x1a/WlFmsx43m1y9OZinYvuW//
	Ezp2garqzTJbaD6bguZGnHhto+grnvSa6k0aU3Tt/EbHt8kBzWX/+v4N7z0YZMTXSu095Xmf0B/
	7sgCsHhEEKc2UHC4FoDLDu02bAZHZXKMXxWIqzJkp/g+sB8Rzqok3oyM2urMZoB6NdXnGzLUcDP
	D+TKrebbsLUg53In+29y7v8vvfEIAXlp0wN8YAn3cZn15Zosz8FoKQuMTJjSCskVNZcQ7/mBr1P
	FUczXbjgig96uTOTSjZD5juh0h9aRIifIN4=
X-Google-Smtp-Source: AGHT+IH2LAsstNAG96JKkITo4BRlLrgS5Kv05TbZGffG83M6Np6d/MhABgYIJd/eYaTcTtT6FUSpMw==
X-Received: by 2002:a17:90a:d64f:b0:306:b78a:e22d with SMTP id 98e67ed59e1d1-3087bb6a6c7mr1594737a91.20.1744943431248;
        Thu, 17 Apr 2025 19:30:31 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:30 -0700 (PDT)
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
Subject: [PATCH v2 2/3] pwm: sophgo: reorganize the code structure
Date: Fri, 18 Apr 2025 10:29:45 +0800
Message-ID: <20250418022948.22853-3-looong.bin@gmail.com>
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

As the driver logic can be used in both SG2042 and SG2044, it
will be better to reorganize the code structure.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
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
