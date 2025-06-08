Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3E25D20B
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425016; cv=none; b=C0u/gcbvT08oINxLPME5o0KQWyS4FjpPdqY0Bb/CZ9Nl56VbSZ2Wce8POegUBfFIW7kqC7nzElAl78Etg8x4luxTxEin6fMa8O4ij2yyyBN47FvVSCrmu8anluqTMqZvQMyOmwXkov2Gn1pIQOciSOUgaJIkCN8WtJ4RVGMhElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425016; c=relaxed/simple;
	bh=6W7L6mLae0Gwk7i/q8VTDrfQXggHDNqoAV/kISEHYUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZbTmQcXm3lfI0PSX9A8cRrJPJYi5/kObwn6oNeeleGKhM3KqWgQPCPSOW+DZbirMEvBi8asXow0+7yzx9uBCUo2OnpY/GL4mDZ/2Z1dRNsJpXvGQw824RE80TZYibKC6loD7UDtf50ipJ/oLd9SeiyBAnlhcaw2MAiV2X+MLDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eou9QjiS; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eou9QjiS"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a44b0ed780so46920071cf.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425013; x=1750029813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=Eou9QjiS8Hv7FsozWkeGPcneaIzMME+ZKlnj1srtduW32TCWCzfd5kkDxa1rkN4fhz
         WPPfZBsqG8piku+/a4MEJXKEKuwslpQbX6Ae6k7GVTPHFM5TTsoNvUBLEeeAlF/K3cdG
         w4tppPzmKJPlkw/3GfrRv0qlvBVezPpHsICEN4phg8eAC4AoOcL+g/SXLVJaNIqbfeZo
         sbqpAU5Uq99+WalbJ0MJStcxDnmt8FCFfWAd2T8qCTRCQ9xiwTWViqSwmid0AZSsI51+
         dcHwHKSOrSoswvKlzYBvoNwwxUB7gmW7SXaOZxXohegYXbLG0NWwNsr6WazbiLLLtg7C
         OTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425013; x=1750029813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnz/0tuwhYz4DMu7YFaY4+MBrOn4ASwg3VdpZXlOjs0=;
        b=QwqjECJ9SgmuwWV1AQ6m5FRJlbzMaIKwQv8WkjY86XAS/t59tyeThCFQ31sGOSaPcU
         QvV4Xs1Ps++aJ/DB6I6mdAf7ZOOsQUuRO/GUKQtUqbheSt3bQAAcc0xijSJGroTqZtlA
         KYCX/0IW51RYKbR9h2A8n/zKP3WzoAF4iemAtQEXHuApnFWsg9VFvqpxPhkDQYMePxaf
         urGOBV0AyJ5pMo/8oCfl47qNj0/aK0luxpxWjnCS7cj1TZ22p7MUbITKKNwayzF69jfJ
         JQS3hCbhfYL6uS4JwJ3c1ognpxgTfmJRp7LWptekQDjt/c9oT7YucW2VB1P8DOcAzIyD
         L54Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVYrrRYOWKeQjMX4TVoDSHatmEtMgx8LbQvxcQAy6uMii3DdWl0g3VYJymbPpQ5B3uSq0SUkY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC81WcAPiMubfAkhfvmnZOKWSmP+Af+5AQe6SykJJ5pGBWdmL0
	3o2lWg5ddYJEFQbBD/KjUInSB5lINEqYs+7lq19S2fxRc0fZFgy5FmfO
X-Gm-Gg: ASbGncunkmxMo6P23Qj9iTFTP9C8OOC//CFwwzU2jSqu3bEqpbRcRFTJSve/ZqBVN+q
	HIJbtJZFTOhgP1Dpeb44mSa4EyW13ouv7axjnd4cVdnXhEyXkiW5n2UMK3E8zMqnOLVKPdSieac
	75BZTslM8jAITUVsmxkYVaDIThLAlxZv8EAhZgxlBHxNTPEq9SETHNEfBopV1wRxn8+NbpwO85g
	LnhQ5IpARaAfL247mHxIDfyYa1IbcOxrMXrYumrvHVNHh6tAzN6egeCM/E2Hj5R/6qqNzGizz3O
	CpLpTbDV0JnRyT3p6BWHaRZ3lCbFtNcnM/GYHw==
X-Google-Smtp-Source: AGHT+IF3xphXoXKZTtdXVGAmCrM+vdD5L5L35t04k2N082DOU5EycEu6eHnJomWRNQdN0alz4WHfCA==
X-Received: by 2002:a05:622a:5909:b0:4a5:a5df:d1f9 with SMTP id d75a77b69052e-4a5b9db110fmr208752761cf.43.1749425012955;
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116b780sm48297791cf.19.2025.06.08.16.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Mon,  9 Jun 2025 07:22:07 +0800
Message-ID: <20250608232214.771855-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..bd8dfa998939 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -17,6 +17,7 @@ properties:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
       - const: sophgo,sg2042-reset
+      - const: sophgo,cv1800b-reset
 
   reg:
     maxItems: 1
-- 
2.49.0

