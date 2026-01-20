Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10491B4138
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 01:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873038; cv=none; b=hDE1vq3pzF0OATBFXt6QF0Yol/P/NUbLSGYKp2QREIVwTPMYQJB/XAOkMhl23MmBPTNmf+0mJ+KwZvS5MHyFf1dG+oUTNjHAKUUPKeRaD5X56RTC/+STFdTOxR8PL1A4qbu8/Fi1skuAaugVRj+3jRn73u7lSC0pswXMUJHREsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873038; c=relaxed/simple;
	bh=zUN0mZoREK/NAS65dk2j9AeP7QPIja1OctRxEL4Ohek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuWK43G2MrwpXURJ1RzgQ6LE1WSTt80zhAlgpjALosWH19971KTC4K0zhjkNfIJZrbX/u/kuU9eMWWHJ79+kAf1tSQ1cv0QgwgFt2Ti3lz0+NWgobvibD4rsWfB9RWQNig6wlxTQ3uUhSwtwRf3DHF1GTuEeWQiB+ljgDlmha20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY5PUqQ9; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY5PUqQ9"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso6707262eec.0
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 17:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873036; x=1769477836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBib4TZsFS9AcrU1FokovNxktrga1IgUe5Nw342C6rE=;
        b=jY5PUqQ986Y0OSeETBO/u8lMTbSquhIfreahPuIXSLtpLXSFYnrooXWLpTqZYJFqWJ
         7p7vVtHsTIb3Dgqv75/dwF92ZaJAem4osmUreZz8THKjyLSCz+NUdILLnGd4nsu+og5c
         T9gfeb6mLLZPMEF2Jw5akpbXPk/Kpi45r0mRB3ZtAFxnT75i1qClH7hVzp3qH6ppXQKx
         hfyjDsSESSeZQYpzhZhKbiA6u/x4s/h3lpZLqpQRj0HJvom/K31NePhapvpc0r2v00+v
         hkER+fj7O8Keh2cIuej77XRNnPVYmSBzsQ36r/P34zKywrX5OFLP9eJQxi+682RkDbmp
         J9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873036; x=1769477836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBib4TZsFS9AcrU1FokovNxktrga1IgUe5Nw342C6rE=;
        b=fHlBHyod2vVNWB7L1djn17yk9CirHWzxrmDPwWWHnCBMSFrtcmbPf+dhsFQedxqYsF
         +hnZ3+fzgSdd37tPTJgrSCIgDRypAVS+S7R0Ic7ofGD4a/R+sxDAN0TqOm6Xaoqr2xrY
         1BgOckMOIohJyUHs4OahSWNiY/MAE5o2jo8YG02GsqcsBouUbMnMcAuwGnknQdwHCpmb
         UB3RFGA6lUhwE5hhXBW1FEZwDLrLFGcxVDNoH5oKamQmjoff3c9JUWLzjURD/LdtnF3Y
         UDYPl2pyra5rwyGMrnwPgmeosQEvD7jL0MuGfON4vndcHfIwi9+kpqCswoV7zbcPQOvh
         GhZA==
X-Forwarded-Encrypted: i=1; AJvYcCVBVevmk6LvCUWdvudX/vQBrMDhGy/175l7zg3RB5425QEx9HNfa1QbFBpLcSM24rFahCEYRRo=@lists.linux.dev
X-Gm-Message-State: AOJu0YysgRRWS1c5C/gnqIxYAIu7Gr1UmPvdrqhClqNXNeyGZ0WvN6GA
	ML03xYT7tNMfsBNczVlUESDQhURtp2+j3zmS5zBPCq1E1zcWmSACJMvJ
X-Gm-Gg: AZuq6aIDTxc8NcJny/dtfeviuxWOpLV2H5u2NSbTg3Eoxs/6LdLkocb15CYgEcEhdNQ
	T5vHDDXiECA0UKSFS1WbOLykoPF0DMn34UWcVR0fTjkvQ4IFcpiZQHthX3x8pbElbeVKd2z85BL
	/NhpGFuJadSBT45OVot2RTvnCWaY1bhrmgklDTnBNJNHS8+Im3FdHRzMQpktLYpu6iVWcdIUUU0
	6QYOV0njHfhqRZ5KKf+rQY7bu1Z2hr03+nNOGh/kdhIlHLH42WR5pVxNjQYdKam7JrQ1t95a3RD
	hbaVo+lIYN1R4ATAvrvt9zpDKlm1K0lbU/qwuHusyZPO7gEpt5m0u5ScI1sFILXTAhdzRGGDP7Z
	DLxVoAQpukro2Il9eBpCnffS3XUNi8w1C+hS/LBzVQr3muhPM+EmCdm8Q3Jmb9/tUsOIOf0D0Ea
	ldnOaim2y9ng==
X-Received: by 2002:a05:7300:3b1a:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2b6b3f1d5eamr8624180eec.1.1768873035879;
        Mon, 19 Jan 2026 17:37:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6bd8e7cd9sm14199031eec.16.2026.01.19.17.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:15 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
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
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Tue, 20 Jan 2026 09:37:02 +0800
Message-ID: <20260120013706.436742-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
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
2.52.0

