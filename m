Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B11DE3A4
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539746; cv=none; b=EPg6ucCpfp585e+/y8ap0bQq2vAlDX6pum590v6WTluqKtNUIPaf8LLM6nbRgPcRGLtcCBsslyci7EBNXryDMGAeAOXTjy1ZIPya62+2b6g1K1uyoYBTzaFLvyVEkfwcNWEvD3aX63QOeowoIOGaOy/6mZ7UnM1syeqekUDuBRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539746; c=relaxed/simple;
	bh=AAbdYSDBi4nid+vR4fUUeQUqMN1ByaToFMJu3nLnoTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxdYhrrsNdOOzD7HfgCBKowEd0KicLzUf7dHHiMX0Tsg/bTs3k/YOz0nQt5wQG5FgAYOk/bxCPT65cCeqPx+kmYCqS65smoFlp3e8Zn+Z8XlfFgyCrC+oRbi1Qw4vix7qJ1ghA2AIirZyO+V29cwH/gVmMRSzZML54HMWZCwiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcuz1tcp; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcuz1tcp"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso305e9.1
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 10:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539720; x=1770144520; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=mcuz1tcpqCunStfEiWulOmKE+WLNZnRwTACOXvBX8pAgE4ff+LRqFiOSC2k1UmM1Qf
         FQ7gn9AW+w3ljcuVbz3Ysey95Zcirj67i18Yoj01H7qWc+BlUFtdLpRtWAh6dH3Ks01L
         KARBZ6yVyAEcTGbYA+r2WETQlh1HtpNoXju1Ze4ttRbYN+0P2hImDh0KiRE6FnhA+mYZ
         l1CkKdeZjKyjyFY+3GTlQ0zE12UATtVDf0W2tq0G5S1dxs3AYlIIqJBRhG61m7zKkTZp
         iW8Xf1MCx9DWo7+tiPmx771szmXC+BHMNBHoaX6uTb1kcmlXetWuxJ0Xw6AzBMUY2l+Y
         7tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539720; x=1770144520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/IAsIdZyjkDQ3l7ZZkRFYkPArXV5TiBiIvdC8qWxZo=;
        b=PoAeV3fMLm0KMoDf9G6BM/LHBu0V1Ab3Mp+ja2WwFSZWpoz0x0PtTSftYmMytVZQDa
         O1ioAro9eDsmlp78lE1/iJIV65lJ0b6vEt8tWRz0nToPW93tFyqa/cGFJ0Yhp3exXXoz
         F+oPGlgC7IKmX9xRyhSbcV+ZUQUAbtwFSo+Sz0I52dQtfKqAdniG5j1zFZEtsGWDh2Vs
         6QiUuCIpssyz6LyoG7QQNCWZssNBBGoiiL2CIudKiAfA+PAg4iS2DrwJtRD3wUQ6vADa
         2cYG0ooPxyE1RLNBmKDUqpOseu91tmCWR0LjNlOnIaGnWY5JTlU2eHnQTLhFoDcJer73
         JY+g==
X-Forwarded-Encrypted: i=1; AJvYcCU4evrhh1bAsycYDdfU8rtybJctjQ+1/Eul18nkHzkuZlBYtZ1JG2BnTrtdD9h1o/mI8M8R9/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyO8HLY2Rj/viuTRwFqElOa/kZ7YRznL4PDN8454t4/6TVmUgKi
	DSrx3PFsdPX3idX4bzU9VbLZw7Vk4ek/abUhztCXsWil5a3MpLszF6vW
X-Gm-Gg: AZuq6aJDi+oZqYaEuHMcX9Lluoy56wsXGnK3Qf6+4ZsMTxO9BIIbcXb8C0bKZg7UX72
	DapClBxAKenvtw3X0CkW/btEmzFpQbnjyfVks6nPd5wTxCpjOkmME2OeQ/KQWmitzpi29TXgMLj
	VWVvRMLmchq289rEP22AJhGplK+Q/XIuNBu/iwBfqBwJXIdWEaWCeSvNJdSzEOR/bLYUZtzXM0J
	pvqR/JknAJvSZ/1T1UBijka0HpUPThQsdGMlfy8YOAfrHJ2Brd/CzYyedNYir91jGQtJgbEeh/U
	bEt7hUqOcNSWl93BjwqboxElbQk0XL7Q7NY3Pj2twKj4wMK+AFvvoxwxUcWVFHi0F0x55psrfcW
	SpfcGR3u4Xh/6iAdiJ4L4oMVFrxbJ/ozuD9lVK+3yqiiibk28KlTr9PW1fvcD5dW+7rp6jXa9Ga
	dXhVzUqD/UQbOxVIvnhLRfb8NEu1bKjYlyXIM/4CdrEHpxXQwd99JVl4M=
X-Received: by 2002:a05:6000:2689:b0:435:a501:359 with SMTP id ffacd0b85a97d-435dd0a3549mr3707922f8f.41.1769539719907;
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:07 +0400
Subject: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite handling
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=1227;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=AAbdYSDBi4nid+vR4fUUeQUqMN1ByaToFMJu3nLnoTA=;
 b=EBjERO/do4uI4s6LDi0EEae7uhFRf1KBOOxPbimgtsnly9GdSGLKz0u7DPv20vrXS76n0vTk4
 V30AAY1GAInD44pnZDm7KhGkPBKJzms0Rgw1lZyPo47NIssrrNme8x6
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Add comments to cv1800b_dac_mute() and its caller to explain how the
overwrite mechanism works and why we force it off before playback.
---
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sophgo/cv1800b-sound-dac.c b/sound/soc/sophgo/cv1800b-sound-dac.c
index ccf386174639..135322bcf6ad 100644
--- a/sound/soc/sophgo/cv1800b-sound-dac.c
+++ b/sound/soc/sophgo/cv1800b-sound-dac.c
@@ -57,6 +57,10 @@ static void cv1800b_dac_enable(struct cv1800b_priv *priv, bool enable)
 	writel(val, priv->regs + CV1800B_TXDAC_CTRL0);
 }
 
+/*
+ * Control the DAC overwrite bits. When enabled, the DAC outputs the fixed
+ * overwrite value instead of samples from the I2S input.
+ */
 static void cv1800b_dac_mute(struct cv1800b_priv *priv, bool enable)
 {
 	u32 val;
@@ -105,7 +109,7 @@ static int cv1800b_dac_hw_params(struct snd_pcm_substream *substream,
 		dev_err(priv->dev, "rate %u is not supported\n", rate);
 		return -EINVAL;
 	}
-
+	/* Clear DAC overwrite so playback uses I2S data. */
 	cv1800b_dac_mute(priv, false);
 	/* minimal decimation for 48kHz is 64*/
 	ret = cv1800b_dac_decimation(priv, DECIMATION_64);

-- 
2.43.0

