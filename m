Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA29344DB8
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016069; cv=none; b=J501Eeo0HYHkjm5J1ElZHoMJy6U27Rn0i/uTmANkeZS212vUSB2Pyf0ZlqV0dZ6XW4kS0RR6oUzR9P8TMb1JYNdmcTZBA5jl2lO3tbPgpqyJi29XJNyyWLTbRcYyQoyIQxN6ref8Jp9iJlkIZHocedup0TMkyn2RYK9q0s94KwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016069; c=relaxed/simple;
	bh=VzspfPtZQgOFnicfHJ8lFg9YZeEZbSTZRsbPCXjCtnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RAynTqavyZPaKcvwBtRjZ4rYcw6FDtsmNPXou25FoGOpqqQ5KtTysbjZJonNVQ3x771u+5nBeEmr0Q8vNUKvNBeR+id446gdcp62+Aud64KLloOBG8YZLmshprojIDIeoDkhrCJZ+pKnwUKv/Lxr6kHTT2WaPAc4pBRj8eTaF/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7nP3Ihf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7nP3Ihf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-827270d50d4so464898b3a.3
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016068; x=1772620868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XR42qk8rq04S2Z+KSvYDZFvfESR4/OwfS07dI/NcZUY=;
        b=H7nP3IhfBXY1PdDKZXQK5VO+jI+W4vTHpDmSVFqnGVhbHyBrXW7Yzyw26Ey9IO3kai
         u8abVrovlzqfFGNPBFjUdwjnv5/KLTYwFXuwW1ev3NwhovZu6rg2jcKp/PRSKoktXbqf
         Xoa09y3abWmCbc88TdOo3AobMeJDlw2y/l+KYFYmTuEk0CxIbYA/sZ154+9G8sYVZekp
         KeWtKCFQYVxOh5qlUtX1v7n6WzN71P+59eBW+BS+69XOqfdcZ1Qosz16yD8T53u32kGs
         piDXXXVHzc7rrI9b24jvH67juK6ulBbYITiDjOPtXdwX+9iZRlVZeZbgFjIUZXnUTjY2
         xj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016068; x=1772620868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR42qk8rq04S2Z+KSvYDZFvfESR4/OwfS07dI/NcZUY=;
        b=bePIwUErksCtxmVgToqn9+P217Uvu5GhsRI3wXxUTTB51yUIkruKHszma1oMIcJbXb
         m2xkFg1yyWA7GZHdrroTHyPmNqcNDGLHU3w764rJX6kM15IXcFJ9I3+V+4A0IBuqFu10
         i2jCyZ98Qci1W/UAvXCneToJorwV3VjzSVTKrGWObVtkNcNnuhsOMLTXbczeq/+oQ2RQ
         QwynYt50LqEyOtvY9vRz3Si5JpnEnk/5TCTNPnzKX4epdyIYfpBay8tHm5JS1WVgNM5L
         paaN9aUFPHUPpNG1jOOmXcZg08RZWKDe0XZIk8z00Pudcvp/lWm1OTiRjPYm+wIL5y+W
         qQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWJTGaZtzdUtjyG8p5HI5gkIPjdxhxan9K/tLU2M4YTJUYgVW62mBAUXHKayAwA2hQOg6uh1wc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAh7l3/iofaH+dfwCDrE4k+mtvSzZCy0W9wZ6Jat2ygwj8/fsH
	IMQhFTz0IzvJ5IofAxHG3NaJWeZUR/eYVE+yJe5glmVfpcF2mUrpUbih
X-Gm-Gg: ATEYQzw00C4VmgaH5ANiXiVeNypbwpg6YXQx4sguYF3FqDfPBVkRRMInJpmRY9GHeJo
	PiFh8uRkfiGT+jqrvPXeQaC82ZuoDvHfJFOVUJ9jU7cDAb8ZtvlmVxHy6vwyLSobT7x1WoRIs7p
	9zW1GlOr8ESlAlgjcwmTD3jJ3WnOAQpwCRoCgUBxpfe5of0AVsZV/JFevDA+kTNf6Nj/iIm/Hmn
	gE7vO7Z0Qk1vrTKTE4y51ORUqGF16LVYgHYnmpq+gkRd3PyFnzCkujGLqA3/7s1BEZ4iYhoU2MC
	Kxk07m6wXEEseWubuit9w5UI6hCHjDaDNJPamYgtCzUo3wo0OhW1i83z7yMn5UFMzfVdvtggNTG
	qwoVxs6lbVA7lcgCy0lirTBxxp2Qy42cFaJ3BghYMc1E1f63XwDBN6z/ePmnP79JcIMMhMWL2Fc
	4/Du4+fsvE+tI1jW+irFdjbE+6eQ1TSNAY
X-Received: by 2002:a05:6a00:a85:b0:824:374a:140d with SMTP id d2e1a72fcca58-826da8bd87cmr15266094b3a.4.1772016067626;
        Wed, 25 Feb 2026 02:41:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a1145sm12950172b3a.45.2026.02.25.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Wed, 25 Feb 2026 18:40:38 +0800
Message-ID: <20260225104042.1138901-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

--
2.53.0

