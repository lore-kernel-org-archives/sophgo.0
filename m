Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20036404E
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539726; cv=none; b=sXVo+F80z/+AhIzDm9xtfkSHvyokkizfvS8HAa/q6e1rBEHSiSGS2ouXGTqp7ZRmSk09Az81f5IjQV4hDF4j7Fvl6xF/XAx27psqHuMw8AE6Ue+3+WS7yuWfBdkTkNgKOJyKHkLrfusuSJIx9GZKCp6PZ9OJuu5ViE08MIuNgIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539726; c=relaxed/simple;
	bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxKJI4DAsCw5v3Gi+F/sS3Iq1UmiDjCX/m0iS6bC/FaYVm2/9jNSfi8cXh0LofYjJhrTiAoLcZTesLel0cZp1oIr6j0m5F1AC6VX9SuLeqXfLmcQcsucZ3oasfM5nFR0T5+CrmgNvCK4qFeMrbiuROCuYS+ElUn0nZFg8mSKkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvJNUM5j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvJNUM5j"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1077155e9.1
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539723; x=1770144523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=ZvJNUM5jt72tP09O33Uvfmr/ev9FamUg0lS0BSSnv6pNPbklb3Tp/Q/toi7dVeLqIA
         OhH3GpbjzHcY+i6QrLriZqqJoSveiibCGlhshbKJnJEPOrCQdPpq95mD54MgCevAXQRA
         XAcXuPQZ0S91ge86/A2wtLXlFaPDTSN0DZNCwyVlwPbr1eKB7tmrWh6ryFfrJ1IC8oL5
         8PYvjTBU50hD9TAdZDNMOs+BzIN/QEW2C9b/Bbwim/UpzeX4oShSSvHkNdVUObeOZIrm
         xPWqIKDDDbvqS91s8fyeXHkURR06iI/pahEPwRUKlYXQzJ+fy+E85s70UPB7kXDqQw/f
         BHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539723; x=1770144523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=hcm6ZXOuYjIdz1JYqk3R0/6C8pHruyfk715zfGJdwgQxdpP/OzrafSE9mTr8DztFmS
         LQSL52pFqhpOxs1zthqDXm6QiXn2IVHQUC49lGZc3PJPcbsfXWy4JkUMKhWRk8g2faaU
         GV5tM6pKMB3j+ZA+BmXxfAgI1G+94dffpHxB5mHMvXOIEfzpQNLvyR5+qVxyDNr2J8eX
         PbAWgwdqX52K7GKihBduko/FQNwAK6CqDXHOi8DCnBhjAfVnrb5JiizAcb/5Qm8Oehu3
         2LSNGmjIUQVsCOmgKGRFN0xX/DP3GOnJVvN/uDMNGxWVj6c1HKl9DhhCi9Qq5vqkfHxa
         jPDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN0Lb7s72VJS0NcowjG89MHhKUAfSxKlQ6BDu6jLwJ/MDx6nQoMg5/l+RwUtd7vEN6T+0HeLM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj6807CFaV+5H4oSOlni8iA/yUCuhuG7xjN2vdPXkVMBDrPM3/
	fuTEH0x/THy/bWsTL2UvhJRmkeVGpiAAVW8O6gpOZuhzNjLhmyy/2fay
X-Gm-Gg: AZuq6aJbJk7Nk5TwQW6JwnIBDOhRZK759HgicP7bSDQ3/hGpOMhxA+O1Uy4FscDDnMy
	AzklU35UH1RjEBIVj2aX6c7xVsYQbyuvBDmkzJs9IvMwPHOfWOcKaik1ou+mPwWpoqKuM2nabyu
	ZdyLoWkQLnL+dAejJp5oE+OR5kBWsHVfFkWG8gvMxSuQ2/8OA/Jdc+Xds5vn+pqDxPOvzI5+LFM
	3GXu1QeMkcnNc6RFX4F9ezJXacHqGPaaiIMdC63cHDNM3qlpIIbydSsLXazibDXsSCQKLPDKvxp
	U6WCr7IXHHQ9Q+hjmT5OIMHC4rz8OibGEoHwhiAYKLbUnjaz/7ZCOoyzyBbAj3825G7l+wjdjo5
	kBaKJKBBEd+S9cej1AWjw3k+UzWo7QAy6VPd4bZUS0pmckaq9qu6zCzrCRQtClajRjtwt9nL5GS
	uH2wffJZfGD8tIRNT70ZmIYXBxN+eV3S2OEqXRfSTeUg/r
X-Received: by 2002:a05:600c:4448:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-48069e9b5dbmr38558875e9.17.1769539723087;
        Tue, 27 Jan 2026 10:48:43 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:08 +0400
Subject: [PATCH 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=N5uJIXd1MfaMnAMCepcgyt3gC9Xj7DoHIF9W3uU+gs94PPz93VNI4wEbeV3fdbL7ZL/vEo6tZ
 kH+9BQDgcF5Bj2ECBnA1a+a29Tr89ihFUjfl7+ue7ClXiU6Yb9Xs6wS
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

