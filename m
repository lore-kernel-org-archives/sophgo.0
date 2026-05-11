Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450C2D7380
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481472; cv=none; b=hlv6EB/PW28qhinX/3wt9CLQyOLnHPDNVZK4Vb5w6v3hDlhdZc97uNX1rZICmHF79XNLmlS+OnhanExD5OkueaHdrJm8u1kTtZB6svhFvgmr5xdAgwK0avuPp3KsSwfoyDRgDsGBMEWd02ugxkFr7UcofJDp4TXxMymQ67UZ5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481472; c=relaxed/simple;
	bh=wh54+hFJBmFzdbHocxMQI0mfnlei85NeRSqpfU5DbWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXfUp/9Qywt21VuDp+sN6O+WPq9UPrFxzjIgQdgkaaL2UB8lR9xsPMbee8IGl3k4W/k06u9rloCw225a6LqLCXI8BFVfUxWBN1CSIL6zqUxUM0BMDfs6sB5Atu6l6T7JG3se7peLEvcwG0GoRMnTsuNIeljgzuOEP9vyCDQDCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLGXmoBV; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLGXmoBV"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1466212a12.0
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481471; x=1779086271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hG7re9nWf1eNGkdto4Ixyj7RYv5HNsRc+oGfPkcFdsc=;
        b=pLGXmoBValNefxNBH5gcVuEBxB7qRm2qqvw1lqbr85QHVWJIWmOe9rnAHtjbTV3SFN
         6/CXXJaOR2tnZSfnUDbqW3QC/wmIx4na2TFzMSVCuBsYHhMU4SDwoFEY3/dYi5aclGGi
         KTHe0dbPApGTphQc/XvXn0h1cJfnhJ8xZ+Z/xzYoDA+3ZFwsR9uCnr73CznzZA5q/L3i
         JMEygzqw4hiCxbS7S5P7gJxF6NJO1HWJWGOHKD1c51/jGFTWao5UngqqMrhPpSFycRk3
         g1X3x7/5TaZu7Ay7yinsVdD/vx6AZ73bncicy2VnK4JiaynBTpLVDrNdA89vuhBA/W7t
         q2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481471; x=1779086271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG7re9nWf1eNGkdto4Ixyj7RYv5HNsRc+oGfPkcFdsc=;
        b=fB4ygTCbng88bycvgRtWxHUX8PBmFRifLy7QSDRnywOC4tdyfDwPyNfUAVBpBsG1I7
         ObkGl2lLm8l7Xi40mk3MgwqSgRG15AtGqqhJcbvxgl3qCIJ4QRxh9aaKtfR8rtgiJM1z
         DcTcIwJpu59gnfRhGjtuuWeepcZLd1QyM1YQUbqSt4QXtrzeqCeVkrTpdlRcj8IONLNO
         +EzF+gMMlPfCAV9bllK1+vBqRVox6TPSq/kV5mIVT1aA0ck3ETjYshf2ux5SbpZj/UbE
         F+1OOAzR/ouMOowuf4TgpEkCdKE/w7ZaW62PPKB0bEZFP702S+cY8QpDxYjPI2Mcj2uu
         22aw==
X-Forwarded-Encrypted: i=1; AFNElJ/pYuHaf/2LNdQpMdetIf1m5UMTodjUA25eBaNXWIIisJZISzgOsUblknvsJrCQYVYJDN9EVR8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk1+7VyE8xDjNdygq3oY7QqkEsVYcJjVIGse4dlrGG7KE64XVK
	O8WvbBAnjo1lxcxlXyn7lcQkw9mOPFr09bE9ZQcqfRwKFWOLJkGrwRc0
X-Gm-Gg: Acq92OElPHXl1k8yRq/P8wIs3MeOUFzo4tncflXe6I6IRuW/x+Gn73qFB0prHx9TPW+
	wawn4Umdba5oK/IwOUUf82v11D0oLN0oSjPdKqk9Z0XIn8YK0hbMHRloXDDlktDHZA5HxZ0HTFp
	50xVQxGTyVm7+jkbndUsb1G1uXVpkhmXBXCykIH8+PGBR5dbPiuaioXVkIDT2L74hYJ68nNpkGf
	uf8izeYrelKHS+0nyMoATG21QckU9EP6o+XPOPE70N4NENmqr3vOS2gYaOeO6sIMl2jU+O8hHCx
	KLAsMGsNxBbY+nqXTcvqZBvEDgAwg3ekc3OMTgJwQww3XSb218OrvGsxmbv5pxHw0FgA5YUZ4L9
	vd1CENMqIGDhvSlzaTUJ6O/PHhXixOslEkQKoR0bbOHFowOLYQPPTq034kwvEPuT4qSni3CbkNf
	HpLM0YPMO5VXmg7DUbqL9kUgUuLTxG1viF8g==
X-Received: by 2002:a05:6300:218d:b0:39f:8b01:d968 with SMTP id adf61e73a8af0-3aab12eab37mr14600912637.11.1778481470932;
        Sun, 10 May 2026 23:37:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82677104b8sm7992570a12.19.2026.05.10.23.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:37:50 -0700 (PDT)
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 11 May 2026 14:37:16 +0800
Message-ID: <20260511063719.460049-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This patch series add fallback compatiable according to the disscussion.

Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM

Change from v5:
- https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
1. Add dt-bindings patch for fallback compatiable
2. patch 2: Adapt the binding change.

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

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
Inochi Amaoto (2):
  dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
    CV1800B
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

--
2.54.0

