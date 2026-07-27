Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1C3BFACA
	for <sophgo@lists.linux.dev>; Mon, 27 Jul 2026 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130705; cv=none; b=qqnaTgJJBpIUH/m6amiAuQqSm3i896nvtcPRkuJLDl2XT3Dc3EsFBkCKuLQlkgWnIchwYOYzKr3VYlLzDnZFaJ6TAWfkZc9f9RAkk4DfDp8T+mIsd3h2tvqT9tRVHqt7r1L78XwS0vkaEOeCNjsAnQSdDvyR+69qgIVARUMvxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130705; c=relaxed/simple;
	bh=+vBXGL5Qmm1AuGKfOAsWPt3FJ0ZCDsiGjZ/nwsxEjgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6xLA+EQhG68CkWKvYjd4UWx+mqF0yiDs8iTWolVuDhC8H+FJr7jaIfYk+98Lpqdei8giBPQ+VQqNZgWquXdxSx0E1ZuZJPGMYuADsTke3RuEUfmF9Imin0VeHiXO8aNPEYRyBKHgkQEgNM+u1NEFkbBILc/E0tP4MpVWEBUdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8S2Sg2a; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8S2Sg2a"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1583593a12.2
        for <sophgo@lists.linux.dev>; Sun, 26 Jul 2026 22:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785130703; x=1785735503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpWXph0J8fUQSdlw06rECtrYKyk7NejeUstbb2WBrtE=;
        b=p8S2Sg2ahBt9RtokM3Ck6R8CLB897pJBgJnrkF4Amu0R8oMqwooIVQDhIm/XOJ4TPO
         xoKgilMOJSd/LgPmQ5c7ELq91jCQWqXlqTkMZ8H5HPvpy1Ruu+G7xo9hBYF9mBCdeB7s
         X5AIgMNXadYdqgwunmkxDvDi4l2lBeFhQpUKp1JgOkFM7CupVWmE8esqjqSLvMC5TMs8
         aFziy+E1bqXHLeCm0ODwKYw20p+vpwbddnH9GvB4S24RSGzcaKHIPRno+SxigTwTKLUM
         UyVAVh2dWqkwOH776Y1wx7fqviDc4QcwBkhhdGUybYng0do+SF1s20U43sX1qzGLCUg4
         FRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785130703; x=1785735503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpWXph0J8fUQSdlw06rECtrYKyk7NejeUstbb2WBrtE=;
        b=QuDxJTlmIzr3q9/ZT62NT/hGSSG8o7gzH9IIv8OVO2xacq0DfIrqaB/OYp6FdoCwWf
         M4iBFQvKcjsGzXne/gJ99+Iw2utP9K5vcxJqlae1ZsQP7vVaGRM/huoECD7R5266hABr
         QOMHmcW6REfWOeRU1r5SluMN3+bWjd2ipZAeN2Ynstum9DYLRdewUJN3aN/Fkl1a7ikT
         +tsm582PtqWRJ6vKkZ2+pPI86MAd8clzkQ5Zkyn1V1+7rbQAVqb83hdkLTvGfvXc9nTl
         mJqEGNNLW1Z1q8rlryOVQLokUrKvfme7/1tK3QWQvSHN3AQJZnvfP0Ut//ARbfukDZPJ
         pvIA==
X-Forwarded-Encrypted: i=1; AHgh+Ros9lVr8hwzgnUG3NCMt5FYCeofku/jPd7qErxMDgUc8+3gzbvtpo6iSGR5tbir44mFa5WlBQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+wyY5ZbBRyMXIv5PxH7lA02i1ivKlUny8TW2CO3U4nEaUm9a
	PaIZX7U4mouwNhNugf3+FA7dtAMRcq9Qs3LBc6gsgE+Ipc4pCthAnL0=
X-Gm-Gg: AR+sD12xW8YhXpwYI64xC6fXxTwXChdA3CcC7Y/u2lOQoOlGaELTKi1v3whOIgnbJ0l
	BRn935iCpt8koEeLBDWkT6/yedU9i7/gLMrUbJyAEI7klJ/gbRsAUjs623DUit2pJuwC1U6z/DR
	Xsj42oNrLL8jBMkyry/LzHojngaW2QxTRFRUlgiAHkFa/wtukGu6Ees86hUAC0uaO3Qo9k09vZ+
	pz38aL2fuPbu31V61FQA8G+WKj9LUjV1MF3Sg6ORd/x2xIhNXPHxV22/4auxHIWMJsikLYiXaUR
	Bf4knZDmOX2ddazePzGYlVoKOr898wzAPoRY+CoGEjk47PwzjSBpRwTYPpHd3ydyEhe3dEE1SuC
	3TEIuQs+8wxRv43UYBYThD1BBJLgxDUmLpXdDSnsP2/sgMCyf2uZZgoVbhWUT/nNanrfT3LZPb/
	2i85cdW5t7IPOtyt3+2en+7/BaEoY=
X-Received: by 2002:a05:6a21:99a6:b0:3c6:3c5b:f32f with SMTP id adf61e73a8af0-3c67e0b93b9mr6666205637.51.1785130703323;
        Sun, 26 Jul 2026 22:38:23 -0700 (PDT)
Received: from t-rex ([2401:4900:adb6:bf0f:a138:df81:8865:91b0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm27967430eec.15.2026.07.26.22.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:38:22 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: stavinsky@gmail.com,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] ASoC: sophgo: return 1 on volume change in cv1800b_adc_volume_set()
Date: Mon, 27 Jul 2026 11:08:04 +0530
Message-ID: <20260727053804.25599-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

cv1800b_adc_volume_set() serves as the .put callback for the "Internal
I2S Capture Volume" control.

ALSA mixer control callbacks must return 1 when the register value is
modified, 0 if unchanged, or a negative error code on failure. Returning
0 unconditionally causes ALSA core to assume the value was unchanged,
suppressing SNDRV_CTL_EVENT_MASK_VALUE change notifications to userspace
sound servers (e.g. PipeWire/PulseAudio).

Fix this by comparing the new register value with the existing register
value. If unchanged, return 0; otherwise, write the updated value and
return 1.

Fixes: 4cf8752a03e6 ("ASoC: sophgo: add CV1800B internal ADC codec driver")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 sound/soc/sophgo/cv1800b-sound-adc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-adc.c b/sound/soc/sophgo/cv1800b-sound-adc.c
index b66761156b99..bd93e261bdd1 100644
--- a/sound/soc/sophgo/cv1800b-sound-adc.c
+++ b/sound/soc/sophgo/cv1800b-sound-adc.c
@@ -251,16 +251,22 @@ static int cv1800b_adc_volume_set(struct snd_kcontrol *kcontrol,
 
 	u32 v_left = clamp_t(u32, ucontrol->value.integer.value[0], 0, 24);
 	u32 v_right = clamp_t(u32, ucontrol->value.integer.value[1], 0, 24);
-	u32 val;
+	u32 val, old_val;
 
 	val = readl(priv->regs + CV1800B_RXADC_ANA0);
+	old_val = val;
+
 	val = u32_replace_bits(val, cv1800b_gains[v_left],
 			       REG_COMB_LEFT_VOLUME);
 	val = u32_replace_bits(val, cv1800b_gains[v_right],
 			       REG_COMB_RIGHT_VOLUME);
+
+	if (val == old_val)
+		return 0;
+
 	writel(val, priv->regs + CV1800B_RXADC_ANA0);
 
-	return 0;
+	return 1;
 }
 
 static DECLARE_TLV_DB_SCALE(cv1800b_volume_tlv, 0, 200, 0);
-- 
2.55.0

