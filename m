Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B533D6EE
	for <sophgo@lists.linux.dev>; Mon,  3 Aug 2026 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737789; cv=none; b=sK2RksJ+h90205uJjCfD02mGLLvv3vszDIR83oamy1NbJcAX9xSAWhnVSgK0VdyL1jT1lxhyyNmRnPz/KmHxkR2jrc956HMgy4lL4bWfbtYKN+Ld90C1IUZG0UpArEzH9unhWYmFqtJhlfz0vYgdA9S5Q13r5cOroeyljMMT+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737789; c=relaxed/simple;
	bh=Eqkb0R/oIqXhkbE+UObfC6eqxJaNV4/C/YFAkbFv3A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXVTlbinh/PFoakZTSmLKXzbm7/JtmIMqJCNDsIhz3Z2fr1JlYpH5GVTJjkyjoB6yMj0U7/CPEVCItXCuTniWScjonhBUvCOoy9tiGL+oVU2SBD25nVjYaCfcJ3PwvCzF2BYxQ5FInp0af2S2+vaiDEsRWczmg8hD2MpL3OHPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxV1jH9a; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxV1jH9a"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3053884a91.0
        for <sophgo@lists.linux.dev>; Sun, 02 Aug 2026 23:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737788; x=1786342588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MC5IkkkPZlTOt+vmXT4WDxhQwZYfZLHq19UwWIDKxFc=;
        b=OxV1jH9azQB7yjLVoBcov0Rtm1BQdSimcWr5K70fxEK77UgsM7HPjD/V6xlzPl/KL3
         IV842JAbUq5RNjDwCi6gEAI4CSSBPivVfXLQ2N2KbFg9ZM061pSSK+ySnQN8V0z8NZkN
         mR5C++mu+hoCneQC8CAln7BIxMBgkeTE3u8LsUxPR0sgIwp4w8IbuAQHz9o6tcphaJXk
         GXDefPJZ3k+AHMpmPaF9mscvEZjLu4iyt28+dEY9uez7j3EmcC93uIDfLFRZyMtChMMz
         jGCMB3YL5AY3JBxo8Ss1kk8FBO2I0BOi2bze2Cz+reM6ePgbNVVcg/T8J+XF6Y270F/L
         uwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737788; x=1786342588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MC5IkkkPZlTOt+vmXT4WDxhQwZYfZLHq19UwWIDKxFc=;
        b=K/gKXBF9URXVBkY6YW2Zyn4BtGDRnDK8WS6Wr7OHOj3Dj/BO1qjY0DhlFqK7YMR/qQ
         5LDF3oFzNhHALly0XYGBln2rL/ewad4D/lHR7bQeKp9Bvpf48CEnQRKtPFgGME95BZO1
         KTN+0WUHiBBxpHohixMViHARbAl0MdMsm6ihjaNgszEbOxQUJB9olqCzmwO0U+sd1Spo
         xWoFk3de6Ujt9Jed3TLMFH885lQZr2QGb9gEFRSuPCsx3YNzYTg4jfWFiHYsPqaF4W6t
         YWVrnPP7c0ST+xR3vtG9dS90ELsK24LqGMJu7KEewkEm3+3iFXRD9BnFZ/mDIDoafuTV
         duCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2n+TAGiJhYrhIos5x1qvV7b03CFhOLpgDwkdenTzh0ess66cuF+zBQBxp2l+gbA3qA5Sh9hM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN2lHdS1B3OHacq7E5UYkc5MFoK6LV27T7N0cZZY8PWdyvQjwA
	EFjLQuQOlG3ojI53kHJ7B/bFVzBYibFiDKcFjbzQfueNPUgG9axhes7a
X-Gm-Gg: AR+sD12fKvY/cFtlJi7VZRufjDWXE29fEqwvmxjqdFNY4EC94bgWEZNdnRTEVUa/ueH
	WRLaV60Q2P+MFmKLlA5lQo0GHsD9UJdnvdrpyygnxRGKhvy5l5szD7UBNCQG7fZsCDRQ0E0i9lo
	J8NhYPm3r0YrZy/fW4l93I9nRfzD8NErpVsMU7jknXuNzCl/cpFvcOdATtDqz6f3znB5iBFgpJs
	y7gdDjTeNEf1sKiI/v1TnKEwuLN+0cnWFlRHOplIXKz4ksi8pbompnvrwODW1WpOEC1vqpEdsqw
	lCxcx/rzKl0NVzufvFbXTFjzVepEVcIXGesNNbcvcxu4o3czV/l+/mRRBd43mMyauPkufOLGvV5
	SB944FfRn6Fc/hVop3Uo1HIGdsc1FCC1BeHaBFLqfovP5JP5wn5VQE6viBwoEZVKPIpqLA49P9w
	ENU5bSABh4Uy/w+oY4lcclNFDbSOgD4TwkwwayiXIGMY6OEQzUD5BlOq5ylDmahNMMyXBJPu6t2
	nWOvYR5gMMsYMgOiH2PEP8DW7D2/LTgWan09GEhJLeq6aMdgAVwbTaDsTXrdkYuSnpjxWYHF3ta
	mSxniw==
X-Received: by 2002:a17:90b:48c9:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38fbc516011mr7192879a91.30.1785737787901;
        Sun, 02 Aug 2026 23:16:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f6539fsm3469002a91.5.2026.08.02.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:16:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen Wang <chen.wang@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	stavinsky@gmail.com,
	sophgo@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: sophgo: remove unneeded devm_kmemdup() for DAI driver
Date: Mon,  3 Aug 2026 13:16:05 +0700
Message-ID: <20260803061605.35485-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803061605.35485-1-phucduc.bui@gmail.com>
References: <20260803061605.35485-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

cv1800b_i2s_dai_template is never modified on a per-instance basis, so
there is no need to duplicate it before registering the component.

Pass the template directly to devm_snd_soc_register_component(), remove
the now-unused local dai pointer, and drop the template's const qualifier
to match the current ASoC API.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sophgo/cv1800b-tdm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-tdm.c b/sound/soc/sophgo/cv1800b-tdm.c
index a97f775aeddc..4badb6e3e08b 100644
--- a/sound/soc/sophgo/cv1800b-tdm.c
+++ b/sound/soc/sophgo/cv1800b-tdm.c
@@ -558,7 +558,7 @@ static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
 	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
 };
 
-static const struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
+static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
 	.name = "cv1800b-i2s",
 	.playback = {
 		.stream_name = "Playback",
@@ -636,7 +636,6 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 	struct cv1800b_i2s *i2s;
 	struct resource *res;
 	void __iomem *regs;
-	struct snd_soc_dai_driver *dai;
 	int ret;
 
 	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
@@ -666,13 +665,8 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2s);
 	cv1800b_i2s_setup_tdm(i2s);
 
-	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
-			   GFP_KERNEL);
-	if (!dai)
-		return -ENOMEM;
-
-	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
-					      1);
+	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component,
+					      &cv1800b_i2s_dai_template, 1);
 	if (ret)
 		return ret;
 
-- 
2.43.0

