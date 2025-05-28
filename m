Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253E279784
	for <sophgo@lists.linux.dev>; Wed, 28 May 2025 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427139; cv=none; b=Roielgdw8s/qgfqkNmzE+C8pgAPyyyEX00TqJnZirX15e32DX/cj0Qbme7S6A4h/s3nrKLVwWRjx+D5waZ09YkjiZIAilm1Rig6V4goNOubc2azqzeBTtfkwG8I9jLLztj9h+FXdQO9zcXoqosgHyVRqk/y0Tn80VFHl3svhVoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427139; c=relaxed/simple;
	bh=3fmT8a4w2c2UFK2NC819rGC2QieFNea0UjuWO8kZ5NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjgWbTqV9V/vtfKAZKVnxTspAKIbDykXLmQ2YjC6HVWDKPZzlNPOEfbPfUsH5XUR3CTwyskPFvMujT9RANuOuUx2snHTks+SJKVcU7K6CJsZ1MufUKAcOFr1yel8i99FHmVJWa7Lvki0sRoI464vqUVB0NI8P2ty9S7TTn+F0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNsfQEVe; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNsfQEVe"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c56a3def84so393972785a.0
        for <sophgo@lists.linux.dev>; Wed, 28 May 2025 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748427136; x=1749031936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZIuoUuOKk0C9c3zdfmp4xS8a8OdfkLmfezVI5NFdqE=;
        b=hNsfQEVe48BTbzAm6mzndYDKBp1SVUlIUeUIGRzh7vSbAi9XGmDDIwQWYjm+bhaeys
         7huvmlSosmdhowSUtAy/WFPqq1OGpkeqfTw7v8Lt5Ff4L4uMTU3yFBk4TfwbvzVd3fES
         gnH1fmPp6frdab5gpwhcEVNFnDgTvLlCjg7HHU8+Vd3ElLBN7Ajv4yaPtSxxf0g3b++X
         muaAFV9LPc6dZmxWUUzgkslVpJTEeEoxSbM7ZJE/Ilfa1WXlNSPlylcgZKFBlUBg9b5I
         YDWk/QcB/7K/WNgQ4ufqeGNMTI/1UvgKAoAKfxOM5MpsfxEyDbYhpa1TB89dnGdUaULB
         q0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427136; x=1749031936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZIuoUuOKk0C9c3zdfmp4xS8a8OdfkLmfezVI5NFdqE=;
        b=HqIB2tptWrSQAhoYGvKdBvUqBXFiXJ/QfDfTGRi8WbQfzsvj/2ZQp9ri2uUodQQeUA
         gh/E0v9TB4I7X+6C7WPznlt3FcpYY84R8ocFXA/VJleIQsw5nIelV8B7gKi2Ma5Rc/WP
         QXdYcUHaBgWxJCNTizKHD7RScBzEHwzjsMoffGvDYAs6i6KjHP/7wjQ0o6GXFcxAo7WH
         sj0vdhUfqjSF8Q+NhrAqFBWUYJJ826uxwinqwwaJXcBeuf5q3fOw1kTukcB2RJ2t+i3K
         94iz5PBGfLkeXaRVrD49ChZT0RIjTDkA8Ht0mFhSc7ScXBNVqCUC4upMsj7Wr08UhvNT
         Yh0w==
X-Forwarded-Encrypted: i=1; AJvYcCVrayTo9ifHz/o6ruJoCQWk9IhUSS213aPE/1KgYC5b45S6UNMqfUIJJHRSE0s8DIo3GiBMIdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyikRpbqrLoBwDpOcE4uCDK0sdulGhz5iDY4OyTcxJvUICjqFIv
	w+5fNFGXZ9/YKz6S8EAnarUhUts367cofJ1wE2i3ClJBq7bMX+ZYmfecpZw27g==
X-Gm-Gg: ASbGncuuj/azyiXOElkvMvkYCOdm8v4Z28Bjr/yp6KuUP/gI9SJzuQfEiHnt62iFbSg
	wRPyQrYFznfgDHWRNAxQ3jBqlxkV4iduZaJM7bKVeKXLOcNoVQjSO37ZYqQ2eeY2sgRul0KtJHA
	UjD53FQhNrkQf7zql8ypUmsohCdS9ImyIUByBaNZKQmJKaoSbGKGZrPvPR0XOMwLYRAwZmQbUoT
	fHDUJk4Cz1zMdX3tYFAPEZCcnj3y1CHzYiL1Zwd/7OGh3ZhpPFILPE7pDhjRqNcVnZ6Wiwslk8h
	3v9WkonFJlEgzAt2dPLPc0cTs91/I3ZtL8SC1T8WLM5m7Q==
X-Google-Smtp-Source: AGHT+IFWPOwlvnziJrU1SXRbxNHI5NCoM7BJbMrItu4d5oRPG+SLE6qRrjKuSLB0YMT8eQPS4/wi0g==
X-Received: by 2002:a17:903:2403:b0:234:8a16:d62b with SMTP id d9443c01a7336-2348a16d6damr97040175ad.12.1748427125955;
        Wed, 28 May 2025 03:12:05 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f118sm8453595ad.138.2025.05.28.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:12:05 -0700 (PDT)
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
Subject: [PATCH v5 2/3] pwm: sophgo: reorganize the code structure
Date: Wed, 28 May 2025 18:11:37 +0800
Message-ID: <20250528101139.28702-3-looong.bin@gmail.com>
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

As the driver logic can be used in both SG2042 and SG2044, it
will be better to reorganize the code structure.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pwm/pwm-sophgo-sg2042.c | 52 +++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index ff4639d849ce..da1c75b9c8f5 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -53,6 +53,10 @@ struct sg2042_pwm_ddata {
 	unsigned long clk_rate_hz;
 };

+struct sg2042_chip_data {
+	const struct pwm_ops ops;
+};
+
 /*
  * period_ticks: PERIOD
  * hlperiod_ticks: HLPERIOD
@@ -66,21 +70,13 @@ static void pwm_sg2042_config(struct sg2042_pwm_ddata *ddata, unsigned int chan,
 	writel(hlperiod_ticks, base + SG2042_PWM_HLPERIOD(chan));
 }

-static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-			    const struct pwm_state *state)
+static void pwm_sg2042_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+				     const struct pwm_state *state)
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
@@ -92,6 +88,22 @@ static int pwm_sg2042_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
+	pwm_sg2042_set_dutycycle(chip, pwm, state);

 	return 0;
 }
@@ -123,13 +135,18 @@ static int pwm_sg2042_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
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
+	{
+		.compatible = "sophgo,sg2042-pwm",
+		.data = &sg2042_chip_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
@@ -137,12 +154,17 @@ MODULE_DEVICE_TABLE(of, sg2042_pwm_ids);
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
@@ -170,7 +192,7 @@ static int pwm_sg2042_probe(struct platform_device *pdev)
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset\n");

-	chip->ops = &pwm_sg2042_ops;
+	chip->ops = &chip_data->ops;
 	chip->atomic = true;

 	ret = devm_pwmchip_add(dev, chip);
--
2.49.0
