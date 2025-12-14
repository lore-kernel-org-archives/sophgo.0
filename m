Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5A3BB48
	for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752433; cv=none; b=VOSLwG0A/GQfzafqXPRDH3OZXSdx/mqL3TOoXPKkCv6xFBnQp5ehkYcX+mVotlC7DNLUphjOu2ZTnDd8n4dO1PY9vEzYwCmv53Xwn0Nc8l63Jp18vizfiRTC8Tesq3PC3ZuWihORVRf/YpsbGNdkJx94LX7Un7PSWN5Fy9UgI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752433; c=relaxed/simple;
	bh=akAwE7wcDd2SCjXGGhXqxByfTjxbJVFWLP9xLEGPGRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGa4Iczsr4yg+oAt4f3qOKrfvuyzmso4lc6Ptf7VFB1IvyJsbmTvq1bGys/y/uuOI5Hu1PtCENuCb/D8R04h+nkkr7HE8ue9TtVkMIuXklzvGCgALQoW+qWJbMxvo+SKe+jc9Cd3B6K0/Ex9H8iCoTKNJJCfyFHmY6rt30Laj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7pHQa0H; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7pHQa0H"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2175026b3a.0
        for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752431; x=1766357231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyPrePrVyIxKolVVQUdwjbRSU8L6ctwDY64qSpxJztc=;
        b=V7pHQa0H3O5gFxAwI24jo3dga3wJvE7vZs2ROUy4bl8c6TzI8OYGO1r73+Z9z7/pD7
         Nqeh1YBmEoV8iKAPKYA8zicTb0i0ICDsWzh/iW2z4KOHRmmvaH4n3aWDP40GTeiuJ5UW
         aHKDDkhY8tOn8ye8H26RyM/mAhK4pOlNmzW2DToC9f+8h9CA40y+XgY92QcjbIIyvWqS
         mvWgc+xlWFGfTvnrAc9Rnvw6WebPsWDXBHeP0xLr2hHf83M4zGCiMhFTeDUIkvbOI1JZ
         dsru1EDIxL/46GZ4SkY2Rsg4UYvmb72DYs+HhmIMwlxbbJ3MqY9oKWWPYq9EQ9ygPcJ7
         meyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752431; x=1766357231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyPrePrVyIxKolVVQUdwjbRSU8L6ctwDY64qSpxJztc=;
        b=Jk2n+dsqEi52FjKM0ORw/pktP9s+H3G6KzBiIzT1ashVRHGj/5EaL0TRiis/rA93h3
         t1/tWeDG0sHwrjIHOERl3VB7yh1K8x/G7Fm2su9CK+4cARXKfjrrGXj5D/kB7BHEro81
         ohfR3kFo6QIqFz9Vbmsw8lKCHhVvYY/A5kFU8XzoLWgnXzQTzMDOXsAVL9qU8CWXf+cO
         OdCHxDXJgnpJv9ieI3EQvd7lIRnF4FdQAROXI42xDRUuqN6ukVxvnRJ5w49ZXE90OqI9
         DtKNxTzk9yDMalp/oE8L4PsOh1KSCywRPifuvtYO+ScsWyvPz6UCF9zwpZT5yrS4mgor
         LpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNG/yk3XCXi2YYpacOt0U1aaGp5yHsinYJbOeJ+MX+kMRhSQu+0RSPoikGefyEu1uyO8iCUS0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSWu6oj4PAoJvysmcaJUaUl/VLSmNXjUpouIGMwQ1/MJ50lJV7
	As/bmey0inxnppBhqe2tieyXRTMHmhvqOss2eyiIvIELq1VfulSmC/uh
X-Gm-Gg: AY/fxX5Vza2SmjtuixiTjAzguZCTklpDUwndxPCq62JzIQtocY71P4Ico2QVeZNyPop
	xiU+g2ZbCsZ3UtpGeNgNm+7S4Ci8cTqN7hleDYTuqFALwoSZ4/aWLFJm3QW2hD0Q6rBrDRnj+7m
	3eiRdwXHwZ12RMJmXAwPLWW2etPAvEVvyPqa74JuOOx++KILINIwk5L9Ik7lTf+wqs6xFciOdW+
	LA3n6h4a84acvHYmWFOui0kxcl8ocad6fP0w5BvjrYNHhYf+ImHYV6c8lVve4nht0cciPDUTHb+
	OfzAiDIBXkiEtqb6euzFEGIpcF2AmVcj8xV8MqVoZMQfSnwF8bgvwFf9SpFFQ3BkAPwu8E7uSXE
	Y+j1HJbYG0rRo0pCN/VgqPTvL0ogzRCkEZu11u9qjAgMx0lg/zhy1bAxbTD4r43jgantFIvWAf4
	AcYIz/TI7K2w==
X-Google-Smtp-Source: AGHT+IEU3uCYji7le46xC0e22HVzvq4FXx0kLGP2zcG2dgpXLhUjKAhMDK/pzyBxMtxqvDCTwIkxdQ==
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11f34bde21bmr6149821c88.8.1765752431276;
        Sun, 14 Dec 2025 14:47:11 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm39517228c88.2.2025.12.14.14.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:11 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Mon, 15 Dec 2025 06:45:59 +0800
Message-ID: <20251214224601.598358-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Allow the driver to use DMA phandle args as the channel number, so the
DMA multiplexer can route the DMA interrupt correctly.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..829aa6c05b5c 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -7,6 +7,7 @@
  * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
  */
 
+#include "linux/stddef.h"
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -50,6 +51,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
 
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1360,16 +1362,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
 static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
 					    struct of_dma *ofdma)
 {
+	unsigned int handshake = dma_spec->args[0];
 	struct dw_axi_dma *dw = ofdma->of_dma_data;
-	struct axi_dma_chan *chan;
+	struct axi_dma_chan *chan = NULL;
 	struct dma_chan *dchan;
 
-	dchan = dma_get_any_slave_channel(&dw->dma);
+	if (dw->hdata->use_handshake_as_channel_number) {
+		if (handshake >= dw->hdata->nr_channels)
+			return NULL;
+
+		chan = &dw->chan[handshake];
+		dchan = dma_get_slave_channel(&chan->vc.chan);
+	} else {
+		dchan = dma_get_any_slave_channel(&dw->dma);
+	}
+
 	if (!dchan)
 		return NULL;
 
-	chan = dchan_to_axi_dma_chan(dchan);
-	chan->hw_handshake_num = dma_spec->args[0];
+	if (!chan)
+		chan = dchan_to_axi_dma_chan(dchan);
+	chan->hw_handshake_num = handshake;
 	return dchan;
 }
 
@@ -1508,6 +1521,8 @@ static int dw_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1663,6 +1678,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
 	}, {
 		.compatible = "intel,kmb-axi-dma",
 		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
+	}, {
+		.compatible = "sophgo,cv1800b-axi-dma",
+		.data = (void *)AXI_DMA_FLAG_HANDSHAKE_AS_CHAN,
 	}, {
 		.compatible = "starfive,jh7110-axi-dma",
 		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b842e6a8d90d..67cc199e24d1 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -34,6 +34,7 @@ struct dw_axi_dma_hcfg {
 	bool	reg_map_8_channels;
 	bool	restrict_axi_burst_len;
 	bool	use_cfg2;
+	bool	use_handshake_as_channel_number;
 };
 
 struct axi_dma_chan {
-- 
2.52.0

