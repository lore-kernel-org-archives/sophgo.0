Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B9322B96
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540938; cv=none; b=uL2xbBcdLHhULHJ1o4Vg51ftNIVQOhSyqxgtY9W5zpXYHfJErveIby/sJ7WmqKpxa2dGEy49Y0Np2QikTtGFzvsGdCdKQ4BsTcKR39oPZAezaCHP8bgbxgqCmhHKqM8MT4IAldvYE5+l/f9wX+RVAl293AvgErMTFl1VQoZikJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540938; c=relaxed/simple;
	bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2TsuOxAmjGwiKnGkuTIHxh56VKXDdu78N/O/x7/MeJcR1zdEyjxXGna+zGKTFeez/hiKOKpdJ2pIfLlfIE2Xt2MnRwXr7cQNu+uLA7J/DpYVLcl2pXIbeYv6fEIkdoltbouCLqEIOVXXZj8p0nwu0DiCRY30/yr+vd2Wk2FZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpSQvh+y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpSQvh+y"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1208165e9.1
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 11:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540926; x=1770145726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=RpSQvh+y8kPzQSZFVuTao7SVYE9OqserjkT17wp7T9Qt+DaqeNXzklyoyhhoPUZ8fi
         h48OHuKGLrbKWn54kovuyl6675Zn9p2Jlm7N6JSstZ17e5CcK3mi+OyjQCZUAvJt1Op2
         uUjOVCqT7qou9lkkKb/Ajl9ANQD8d2TBffEj6QnSADqDh1b0BBDsOOF+PXZd9M/obg6j
         jePCEaNUG/BeYMkuPvc1BwIZph2yPw9UZvdwackPvXjQCzmLk4jlzF9dV+PZ6KPIcE2+
         H65FdKkwSwsytbfaoh5qiZqpE671lGTf0vUeihVcgZwnXP/UgLdmCkz5e2JSF/FHW9VO
         4gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540926; x=1770145726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=N/w7qUd0/V23d4MIvkb2q+1zabcyiLXz4CCMmbv4oJyRs5vN/GR+hOGc7D9aIQb+hJ
         RwC+iW6vKo3wNvrqE3OukqzoQPGQRRSE5C/oDvxniNJDmVtoX7NI5/At+bci0UNcZcEp
         j6CXWAGcWaZMgBfFs8aNrdmHiic6HGhMD6BxBCqrSJjwjsYiUBKRvZYnmL3Q7DpItQiW
         UgyWPBevW/oOnRO7989tZ5Xc0Fu7SbCgq3pY2FPS5/WC6fEIE0xzMxeSkTPPKqSKwTF6
         ICdr0xevihOGkDuRF746nxj5TROcxGdKhFYhg870DHztgXViPvRFPNfgQyeK1i3ykFDj
         4leQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/1BIUzHNTq27jhMjTdBjLcnNcPQX5noBbS9Hsa1aTloZ9BTTVz7yLRd+YK+bMDhox3wKnGhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlhDxyrtNZqBMea2U5uWeLllPYlRajmKLvWvItq9tQBchCSfJN
	jHCPrYG7QckAQj501yFkO+f5SM7KY/cLrME3PDPf8uOJxIyAZntul1Z0FsD14A==
X-Gm-Gg: AZuq6aJGb+DmgWpoGsAFbKSJ7BTa/D+lNHfRfNWasA3HMDH/3gAl2rAJfUCR3IZgtO8
	Doa8xG5cJwoV1GhCbYu3S+5LmfX5urw3XaFdM0Zr+BLtP1KiRglzm5z6aDevaGJnEKsyrCZy5wV
	z6Jt/SWE5kxZB4102HxGym9mH/1Lh+zPFlvmpjyncKC6Kw/dz4mebJwV9Vzay0YfBeLUM10hbZd
	BruVjGTgy6EB6DxVWYIbBYJtRky5pWN3ca23bY2b6fWlzHy8LFEIMTljUT1q2oCoTirqGV7H8Su
	wOgGL7aI8Oz5XzKiKHAaXE37gpxuFFRnyFm1BzDRFA6T0jS0XsBZjZyfLVKuEJA5ZAsJgYGcbjw
	5iVC3Hnabk9HhDCVCaoG00no87xvquOchse6/16IYZeMrlMIQgg9k3zGrnrRsYe5peg1CtuG98v
	8kUT+jkmZ8ucV+QQwujbqE1wnJFROXgJvk6p77pWLktjJm
X-Received: by 2002:a05:600c:33a6:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-48069e0fd24mr22092945e9.1.1769540926002;
        Tue, 27 Jan 2026 11:08:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:45 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 23:08:20 +0400
Subject: [PATCH v2 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v2-2-5f66b841f63d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=/rD5GXHuEV3Sch9Z9gONegfTboapMyzZ1kxLPbu0BxspfEG4J5ZGlb3BJaQZ1f5WUa+G/K3eS
 KFadRcvrmSsDhGovRx87GE3yJ9CT++kOJFN6LW4GVcq35PrmpLbd6BN
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Restore the empty line that was accidentally removed earlier

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index e4786f087589..9b454261bcfd 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
+
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc

-- 
2.43.0

