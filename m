Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6B392C5F
	for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016075; cv=none; b=JpRTzgtFeiroYhU4MI6AvqhTtxBGuH176gGtAs3SaX+5SbDzU0somit+OFBRobQrWm0rVLBQYRgl+oztA9roBOx5y8gantCYgKUMzV3lg/eRLYKL6NgETjrIrNVflDnTp1zOgYM1eNYeaKZbq9TxUikVAykVJ7WTBDZ/2fql/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016075; c=relaxed/simple;
	bh=p0pJb4wR6PRU+wXa5zMbGWI2UmzpUtuLQnTO26ezUMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9Ke2ixF4MIqnF2v+16H92aLaSypdvGBjczATAQUvVBsrisomtYTbeXr9jjBrPoE7aCaydl5uCE2cX/BfFZwhQUYayrlgCOF3a+9uBY/xWWStxsjkXeXIx7w2+8tb1N8KE9d5trRvCFBTaTkC5E0AqGYNNmiFFamcKnw6Uces2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH/Gs0xZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH/Gs0xZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a962230847so62713075ad.3
        for <sophgo@lists.linux.dev>; Wed, 25 Feb 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016074; x=1772620874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5peVG9Q2XYh9oaZWaeVmzNFFF3WeNUswB5+Or4VvBI=;
        b=gH/Gs0xZ+UH2wWcq1qCY71CQ2N5EW2/uCJe8JhD6YTCp2y0/RCSx4aFDQWAfjcElRh
         aoj0OOWzXsf4hoc41qmWowN/RPramdJQXAYVWbtXUV6szrsJtkbK5iURkXzrg59jdwQH
         JVkU3M0MaWUt5vKt2TEmf9utqzuiYViigCVo95aQjhq/Igrbd/f252W1xFVBQjvcn11r
         b4QdgqChvaecszDBRs+B8iJBEKl/o50EDQUuHA9ur6vNWiXeFet0t5n6mKNvebPdqjhE
         T6pjH5dEOI7r/LtxWshPw8UFLEO467ZLwNtrmP6ErFyvG1BjmtZlwDZ2WAoeaylEHFAG
         Wypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016074; x=1772620874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5peVG9Q2XYh9oaZWaeVmzNFFF3WeNUswB5+Or4VvBI=;
        b=dcrgUNfrOuWfNTl8DaNpuzl6vxjikSoptjicm3l34nmDI4/N+pknII3cLtL/8v8Frh
         Zk31FVKzz+0dY3tZzNO8TtvOjyFgFbPdvO+kxrBSTphbNSblyjwcUvTW800KS4ONJ9vv
         4oqEV5zdi7GMdhjLtG/HmowaWX92pdugzOZ047d6dPKBKmBbiMGcU8sRQgSDjCeXCumo
         Ok4Tvx0PSolSo0l4mBMCpKwWTWbruy/8bb21mvBPk0i3MbDqwGPp1rye0JmTk8MFnuD6
         JmKpk1NSZw4DeEwjyeZqpqKFL3jMvoEA9471916PtXyPeFHZ3RhqXsnAjjGI0j5ihfF8
         8ZLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqkYDRYp6OTg6o/5FKyDLcxX12384RmQWN7Wd1NnWHZpmQbd9yYlyd0/biZUW4MnjQDwcNF18=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjE00SYiYLUwwlL3YtnbQTDZjR4/v9+ksuf+Lq2MQ5+Us3/sPX
	f5OdjUMooaEKfQGYgHN+PZOdcVFjY7gt+laEYxIEVdnn/cM6gnycYZsZ
X-Gm-Gg: ATEYQzwMefa5kfUv/32vySKjlv4SEvonyAUP0Quc0YA1pTudjMNCMOBrGM7HI+Ad73k
	oTFN7/LWqknAEmCX9UPgP//wtMx9xLHE7Th1wFEZ/trmAg505887y7VmtgHTUxRy5Dh3mxDXlKk
	nWGUfcKsNAvHHzpA5ObR0JOSlLceN223pbG6ACRiFtpIMPqAumCez2mkhdHDAbjbx+46as9O4hp
	VAU6+6xt5tFFTBrgHs2wzwagAwD8htlLqzDQF9L0JRTayzuDKG3FPhdN63KhHIJlDQNTerYQ+lR
	4wY25Q/2U+YjN/DebtDK8QUiBhElWcWryUKEBn/8+LvhflLkeWk2vLUykZRlsdVYPkkU5nAdM30
	LrtYGKCMsB1IuoE6ldQ3fEuKNDOUAdRgkbXdoIkJCmHD6KiQQ/N0+fJFD8VnIOFJ+sUAFxShd+0
	HLbP3Kjyyi2xJRHt84sGYgNQ==
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id d9443c01a7336-2ad74556f97mr158162195ad.50.1772016073682;
        Wed, 25 Feb 2026 02:41:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dba7sm133070865ad.26.2026.02.25.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:13 -0800 (PST)
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
	Yixun Lan <dlan@gentoo.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
Date: Wed, 25 Feb 2026 18:40:40 +0800
Message-ID: <20260225104042.1138901-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 5d74bc29cf89..ada6dfc9b673 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -50,6 +50,7 @@
 #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
 #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
 #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
+#define AXI_DMA_FLAG_ARG0_AS_CHAN	BIT(3)
 
 static inline void
 axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
@@ -1358,16 +1359,27 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
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
 
@@ -1506,6 +1518,8 @@ static int dw_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_ARG0_AS_CHAN);
+
 	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
 
 	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
@@ -1661,6 +1675,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
 	}, {
 		.compatible = "intel,kmb-axi-dma",
 		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
+	}, {
+		.compatible = "sophgo,cv1800b-axi-dma",
+		.data = (void *)AXI_DMA_FLAG_ARG0_AS_CHAN,
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
2.53.0

