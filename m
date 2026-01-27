Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126DA3644A5
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540933; cv=none; b=YYPDLDf9AusgvwCu2MMXbUAk3pDims1b7TVDoHnsVG/wwYD+N3E/LPYppIKItlHMhiNweK2kGGWA9nRAtL7LsqyEuWBDtQI0OjnsABh/lwwITdU4GXfCHLqj5cG7fR1H1PIGXzk7t+C88+E8GA+zE8036e4r7LEj00tjCPaSXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540933; c=relaxed/simple;
	bh=zadY22GSPVPhNTUtDV/+6Sluf6seV+Q8lASvyVpCmJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxeUf34100Ny9jBRr4G0JBp419/pwYj8jRUhjHdy5SIplW1jzROK1N2CHoaMiEpEAGuGWxMdVIUaELXS9mzFLZ1knaMt9zRkhc8c98cc7bNm0iWLVx+gv1B74C5Fz04V2x5JV9AKtIgmWPZTWymxEFiuURelritSDjelkXsRTSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9VRmG8d; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9VRmG8d"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1207855e9.1
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 11:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540923; x=1770145723; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=R9VRmG8d12v09ewmrpRZ+EusTYtk7hcWQ43TGwDQxpEHTOb/uDEl4wgmsUsnsL91T4
         p4N4E4yeE3OSgE6A1bl4sUM1NAx+HqQDHvMk44aGuGBAmPdawwN8OV9zNz0vILYmE/SF
         d5nESWS2qwHJXmrHy6QYWbjx/mZbD+OktnSkZeKmlKmOqfUyRuD55B3pEALnUy1yzszM
         /0t6/2ngGt+OdPCEeAJjiFAglzCD8QWBldUKvgcdHeVYroYsrs8g/EOap0MU3aSI7pnY
         SZzD0L4RFhSfTSSP0hsRtJ4zPdNhENdsJ4WqyNxptCI+jnLDgqiXRLdfG2ThH12Q4HjH
         rYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540923; x=1770145723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw0L4UiyDeVexCr4mH5MBXgON1vZTOJNFRmxBOuEtVE=;
        b=i+6inlE+zhlz9lsvUzCtj4nPw1MYOXPcIH4Ko3DfwPGM1s5RpwPEqBeEPMHGPlMbBB
         r2jnYJWFnlUC26Qna26suGQ0Ca75k0c/sMunnJHe1APGAO7JA74V/TF7+h1fl8l295b/
         iw1Al5Pd7LArkr04Wnh/Cr3tMQk4DhMzl01UHD2v6/t4s4xtiFAZBP1tnWjrec1RbukQ
         zKSoAfcjqnGFb9KqHc4iB6nhVSM11eWwQtJyYnT+gCDnv1zeT2laC9jFj9SJXamnxse0
         uHZxnawIxrH7wxYzcG40LmqhPuJVmwj7c1ASbAbN+qyul4oVCSmVRYPR+JPR+xtNO+Tw
         nExg==
X-Forwarded-Encrypted: i=1; AJvYcCV9i7aFCVqQMiioBrdWaIOsna9W2YSoQgzBrdxl8uvmJ41dSSo3U8heGmWnUJdyuZyXCB+HO6g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7ccJh+rwjQc6WGh40kS814S5B4RL+gq5lOrqGs4WcLgK+s4jn
	To/2veKHXta3Bxth2AG0+FNIEkNsThY6VvKVyxXY/UqrWVUpdhzuXzZN
X-Gm-Gg: AZuq6aLwMj/lvdb4FzvimOHGPzx62BObIInoau5tmjO5uuG1z2K1u9xutrNnHz0qLbs
	p6tvJ+3jgEEg0s+fIgub3SLHM2bpKnPWurLRBzoPpnIYn5zsRlEJcPZ/Wah9ij5gjtA5PhQJ59w
	wFa3B487je+Jq5QgTh+jfOrIgBjkFDFMdlc245TlqdzWKLIUp0LRZipEom7QTJpDHFYc4Ezjndt
	ca6gH32mEww0V0Qs2Q3Cv2AeuwYa3xDP5mboS/psI4REjnz4GCzIzp7q0Xt1+P+god7Fy/b6gCN
	pGWbyR0p3FHd4UDoHI97pVLJ1+GsprbPRlSz5j5zOXnDH5WEYRa/ft/Z9alNqOVmpADRiX9hoAc
	flG8FwLvlrR8tyzcKH8ey8nu7B1+vRUJa4BFPtwkwFC5Fm5kDDG/ND2eS7NjTcqRgUrj94+5SXq
	6oxjadtsVJMiEhup3ANe+JrRj+Rvo+defwaBOxxmtQOFL4
X-Received: by 2002:a05:600c:821a:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-48069e95c98mr40755575e9.15.1769540922876;
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:19 +0400
Subject: [PATCH v2 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v2-1-5f66b841f63d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1287;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=zadY22GSPVPhNTUtDV/+6Sluf6seV+Q8lASvyVpCmJ4=;
 b=rcy0EioZSDj08un85FD4cMTF4dOy7DTuSQ+7myJ0yfgsHFL4rCXoEjKKSGdM7eWN8MUM5J+1L
 rSTdu+GC0QwCHnuC5/qCHba9LWd4lsde4UUcAK/xj9+KiVKjYPcIw+f
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Add comments to cv1800b_dac_mute() and its caller to explain how the
overwrite mechanism works and why we force it off before playback.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
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

