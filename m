Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30B192D68
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355582; cv=none; b=By5v33tI/giWTi7R2TRjPQZecxQZp8g9tzBZckE4VbMrCsCHj1XRjWz+/Le7uAS5xW4xPgFJdXA0D0taRiRT1mrThYLiYSPtgJYyQj/Q13gg9p6YqXXpPpY1C8zmZfrmRonYo2VFUQXzoPnF0OyDR8voR8abCzYMzOBrqZthmMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355582; c=relaxed/simple;
	bh=Qwx6fv/GqSvqJlTQbWvsEhU47PrbM1JGclCAdgShXfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1LCqlhMR8PF6HbcQoZJ/CygSE4PlipBPiAV07L0V5UP+SeTsKYO3Ke4D2O+HB6NL70IvnHAJqKQ4UQOZkrwtSA6SRHu3IbBsXD4r+Q3wP5jRCKVp9w8amj6r1bAn12rjyM+HvV0p+5JedQKrdFVg9wbV3WMXvhoaNNI02gcztM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WS4/WgA6; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WS4/WgA6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-48d71b77cc0so16192041cf.1
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355578; x=1746960378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=WS4/WgA6Hjrabm546RXQ/B93IM1v5jhzxGMl16sEpP4238ZFoBXgye90/N/6lK1X2Z
         40y6zZSDtN3zKzhTX1nIpx5YBop41zi7hBr7c1yTvXDp2NJ6Pk59wpCTcQQy+Ky+l5mP
         13IRbYOTJdf7aqIFE471yS7pvTN+vAymyjrcWDB1Tf2wm4Cq4mRB+VlH/S5Np4JcvsLK
         ITJoNzQpE28dat6Cxw+foSAricIvePkM20JnefirwLqcjhXFLqLDYMrVhF2QZqki/ziw
         trLRzA4BC1CvmKKHBbeTqCfEdJNGzlvsoSUpN/V5sxngCNhEsaTii+ke3Zp17IBp+N6H
         3i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355578; x=1746960378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq+V10Dns5XsDfB+eto5dT40TdHnbLnPhgKmmJjTtqo=;
        b=Hqlqxrmm2Ilkr0l18bRpKoUpe/JiEYUF+HGLDxbd7xcfcgAyQrRdOjDGURBikKXTP/
         sv9q70XwpYY+jTrJfdQ65H1qUbskYVR2lxd3kgBhgeXkmhBpi5gYxjiMUiGkgv7PunMh
         QMX2e1toVKprETNBn0sT9kXgQ7MbMu//LKXBSdGWGrAXyhAZK7R4C3xa9H+9OKt/rSLx
         P1avrs5DwMFe5uT26OnKICsggYRiLVZA11/ICdadmSS6xICaoscrSiVRNYc6cgOhyZjm
         ARZ2i6SI6S9cU0BgYhysSPU4mSToRl37s3cqZP/xG9Kz3gDfcL507gI9z7Gr8GDk4i1N
         PP2g==
X-Forwarded-Encrypted: i=1; AJvYcCWOYp3lUwAHHwNaiVoymkemvKIEpwwuydi5J5CHepL+qojnTAaGNiQz1mQbmS4C2IiBP8y4/S4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFLuI7s6aD31kGgnlhJ8G7rWgfcfaiaK1sA9NQoykkqEUCwqWw
	8URhfk6XRsT2qCdB3xMc8JaFX86fhjLBllpl5TFoXZiuxupBSWyl
X-Gm-Gg: ASbGncvKkGXcHIzvZlGOIJzbG3MDEYf7F92tkDehpxq8J9dWJJDxR3/zXzhbPp5p2lr
	Vbe1DA2BDp1QZiB4sgC53x1OBQvM9jYCfmamD8pBme9fMZjGiFD4dTAH8ovmR8nuQpWrfpNia2R
	nPvS91ixn3bFOf8H0WOv+NWMHgUQcUTIb+1MgtBZ9D1szqBJkdGdYzglrYMlmm2XqycGa6Vajxo
	8q0OpLT2PNIxY4W45dTpezdwr3ZGfKll3ICiss44sBXqLEpGLdVwRMul3GS482iLsBpT7ehJDch
	BgN0CCI9xFO/b8EI
X-Google-Smtp-Source: AGHT+IElXOJ8VLrJgB2ldI5hP8eRxH52DW4UdnhojjCazX+wPJrTxe+0SKD3E9HjgZkTHUgG8JE3eg==
X-Received: by 2002:a05:622a:1a29:b0:48a:d979:9a38 with SMTP id d75a77b69052e-48dff3e17a6mr55044671cf.2.1746355577750;
        Sun, 04 May 2025 03:46:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98d10309sm42842181cf.79.2025.05.04.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Sun,  4 May 2025 18:45:49 +0800
Message-ID: <20250504104553.1447819-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The part 2 of dts rework replaces precise compatible for existed clock device
with old wildcard one.

Changed from v1:
- https://lore.kernel.org/all/20250430020932.307198-1-inochiama@gmail.com/
1. patch 1: reused sophgo,sg2000-clk for sg2002.
2. patch 1: mention sg2002 refer to a real device, not a wildcard one in
            commit message.
3. patch 2: fix wrong data for sophgo,cv1812h-clk.
4. patch 2: remove compatible sophgo,sg2002-clk.
5. patch 3: adapt the change of patch 1,2.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi          |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi           |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                  |  2 ++
 5 files changed, 17 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0

