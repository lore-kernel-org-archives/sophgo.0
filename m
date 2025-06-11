Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5FF237707
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629479; cv=none; b=dNd1Du+LdHwv9OzC17bb8We3W//Mlr98FUnFS1jqa5sXj6zJ88f25UXz7EXNDqp5XLOgNScdLEDN30qeuU2iyprgkucQOQKH5YLywdczQeIiClG/bb+SEVvlIarXpPd6WkVPPG6Z3iqUKuAsKDnrPxaI3nTtlX0ABvGCFOCuPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629479; c=relaxed/simple;
	bh=wIra1MWBnEI/KsITvp3fLFz69pdc65cdIKDFZs1NPg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaYTovUFIFAEOMXiN2aNHNEGO5iHR7Ri8d6aZ0jxt7ZgMY0MV+dqfasSDrpXaIOMGwTr+dPgOCMtRwygVtQnkjBJMK5SndPW49lD7HsVbBT/vKBk0s4nS8xPilssoezRqirQAzRKWaHJTHBu97PVZw5tgNuiePX3CUda5v+QfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+fXGePt; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+fXGePt"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d09a17d2f7so517458985a.1
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629477; x=1750234277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfE0nW/hFb6tBNeavOb+VIi0aPnkDiPh5uKKWZJ8u8M=;
        b=Q+fXGePtX7LPnBNSTZMjJEwwVhVKFqQRwDLkTPhxetGf3ZVjaGgnGTJRFNgJFsDceE
         Umyx79InvOFt7GywYIENPuEMEvErLO8C8JUJluISiCslgAC3xsFq1U26DinsNAmjBroE
         JdR6t2HdgpKrzFSXe/wvP5bFst5IfCekqEfAUjb/WDOh99T44hzY3RsmO8KQoqzyeyR3
         izMWm3ArVlHk1L0F02AKJMQzzLrpvjIbtw9KA5tVVCkTAnaoSvl3/PeWPPV9UI/aTRJY
         yRHUHChdJ645ZO/S6I2f6ZFWC6oUL13VU2wWwFrgAVUIXdWMey2MN/BhwrmH4zUjoEbt
         gyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629477; x=1750234277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfE0nW/hFb6tBNeavOb+VIi0aPnkDiPh5uKKWZJ8u8M=;
        b=VqPbLss+Pp96W/17dVhLKF4Dv36rpa0XwKKYgGVRNDC80ZeGXhzsOvsKK8qyDLuiDK
         Er7+UEfDigGmDOJn0UUgftyaXS0JoMbeGzwlI2cudTq1R87No8TSaBNrkn1k9E0Wt4Kr
         MXbNy/Kv6JJD5NdaSw2o4zpIi5gAmC1q9zNg4t+R90DgJ6/0vXiBAQzcaovcy0qnxi/L
         Sp4YA40WJlhHxoNZ4/nroKVj8wTxhDX5axzmeQI+BGe8aig7kc3LZODHtqU9s8C41fQU
         poroWug/3yr6OMSe/hef5Eqn/Xn+W5T6C8mMnIkHC76TPMdarT6tWWTqhDtijHkx3McD
         MK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXMOU5RlDX5uIe6V2FK7r1WHgeSVj+8S8Xtj3rn+0KX8LCa6PlO4ZLxkSl5oAY61r7lSOYjBU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym+11jUJWzmSqoOLeKwGtQghV+z/YjzzkNZfazHB0IGANRKxqv
	uE47x2ewS7SuV0YLLcfphn9TbTCTMrDQuKf4DU3+ZZnKlvw4bWrKu6WF
X-Gm-Gg: ASbGncsqGLwkE6OSQoOk6Xc6wWLjv66hQnv11orFdpMm7sXuXVTFsWU6XwdAUrtqB+u
	JhQuM5hcSZLDuvUVH1eVeppSTOYKhQ+KPLTBRr8JOxkv8rrBVKaxa7asYmDnvyAgq4PBSzZCnZ+
	V96aynEStXpI8WT3JfWZyFeU2hR8MjZNdJDp88ZKeXBhQDazTocnBxZZW4BFp6vth4HAe1ogdOl
	gvR6bMo6yuxk4I8QsZyUltTGoLilq1fDebUemAp/X9CMQ+s2HNtv2zDvtc354CvFS2yUQmmA/8l
	wZMdy6ZPmYLT+vBnVFotdELHkAUXEMYM+TXcoQ==
X-Google-Smtp-Source: AGHT+IHJOgJ0+i6Fm4WsVk6l97AdazJZq4HORq5uZJ9u5vD7oiYxkJmbd9sBY+uytt5GSpvDEFY+hQ==
X-Received: by 2002:a05:6214:2343:b0:6fa:9f9b:8df0 with SMTP id 6a1803df08f44-6fb2c365ccemr41834396d6.20.1749629476688;
        Wed, 11 Jun 2025 01:11:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1ce2csm78828286d6.56.2025.06.11.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:11:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v14 2/2] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
Date: Wed, 11 Jun 2025 16:09:59 +0800
Message-ID: <20250611081000.1187374-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081000.1187374-1-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
its request lines. The multiplexer supports at most 8 request lines.

Add driver for Sophgo CV18XX/SG200X DMA multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/dma/Kconfig          |   9 ++
 drivers/dma/Makefile         |   1 +
 drivers/dma/cv1800b-dmamux.c | 259 +++++++++++++++++++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/dma/cv1800b-dmamux.c

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..5d81e34f8e1f 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -572,6 +572,15 @@ config PLX_DMA
 	  These are exposed via extra functions on the switch's
 	  upstream port. Each function exposes one DMA channel.
 
+config SOPHGO_CV1800B_DMAMUX
+	tristate "Sophgo CV1800/SG2000 series SoC DMA multiplexer support"
+	depends on MFD_SYSCON
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Support for the DMA multiplexer on Sophgo CV1800/SG2000
+	  series SoCs.
+	  Say Y here if your board have this soc.
+
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
 	depends on ARCH_U8500
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index ba9732644752..a54d7688392b 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
 obj-$(CONFIG_PXA_DMA) += pxa_dma.o
 obj-$(CONFIG_RENESAS_DMA) += sh/
 obj-$(CONFIG_SF_PDMA) += sf-pdma/
+obj-$(CONFIG_SOPHGO_CV1800B_DMAMUX) += cv1800b-dmamux.o
 obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
 obj-$(CONFIG_SPRD_DMA) += sprd-dma.o
 obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
diff --git a/drivers/dma/cv1800b-dmamux.c b/drivers/dma/cv1800b-dmamux.c
new file mode 100644
index 000000000000..e900d6595617
--- /dev/null
+++ b/drivers/dma/cv1800b-dmamux.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/module.h>
+#include <linux/of_dma.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/llist.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+
+#define REG_DMA_CHANNEL_REMAP0		0x154
+#define REG_DMA_CHANNEL_REMAP1		0x158
+#define REG_DMA_INT_MUX			0x298
+
+#define DMAMUX_NCELLS			2
+#define MAX_DMA_MAPPING_ID		42
+#define MAX_DMA_CPU_ID			2
+#define MAX_DMA_CH_ID			7
+
+#define DMAMUX_INTMUX_REGISTER_LEN	4
+#define DMAMUX_NR_CH_PER_REGISTER	4
+#define DMAMUX_BIT_PER_CH		8
+#define DMAMUX_CH_MASk			GENMASK(5, 0)
+#define DMAMUX_INT_BIT_PER_CPU		10
+#define DMAMUX_CH_UPDATE_BIT		BIT(31)
+
+#define DMAMUX_CH_REGPOS(chid) \
+	((chid) / DMAMUX_NR_CH_PER_REGISTER)
+#define DMAMUX_CH_REGOFF(chid) \
+	((chid) % DMAMUX_NR_CH_PER_REGISTER)
+#define DMAMUX_CH_REG(chid) \
+	((DMAMUX_CH_REGPOS(chid) * sizeof(u32)) + \
+	 REG_DMA_CHANNEL_REMAP0)
+#define DMAMUX_CH_SET(chid, val) \
+	(((val) << (DMAMUX_CH_REGOFF(chid) * DMAMUX_BIT_PER_CH)) | \
+	 DMAMUX_CH_UPDATE_BIT)
+#define DMAMUX_CH_MASK(chid) \
+	DMAMUX_CH_SET(chid, DMAMUX_CH_MASk)
+
+#define DMAMUX_INT_BIT(chid, cpuid) \
+	BIT((cpuid) * DMAMUX_INT_BIT_PER_CPU + (chid))
+#define DMAMUX_INTEN_BIT(cpuid) \
+	DMAMUX_INT_BIT(8, cpuid)
+#define DMAMUX_INT_CH_BIT(chid, cpuid) \
+	(DMAMUX_INT_BIT(chid, cpuid) | DMAMUX_INTEN_BIT(cpuid))
+#define DMAMUX_INT_MASK(chid) \
+	(DMAMUX_INT_BIT(chid, 0) | \
+	 DMAMUX_INT_BIT(chid, 1) | \
+	 DMAMUX_INT_BIT(chid, 2))
+#define DMAMUX_INT_CH_MASK(chid, cpuid) \
+	(DMAMUX_INT_MASK(chid) | DMAMUX_INTEN_BIT(cpuid))
+
+struct cv1800_dmamux_data {
+	struct dma_router	dmarouter;
+	struct regmap		*regmap;
+	spinlock_t		lock;
+	struct llist_head	free_maps;
+	struct llist_head	reserve_maps;
+	DECLARE_BITMAP(mapped_peripherals, MAX_DMA_MAPPING_ID);
+};
+
+struct cv1800_dmamux_map {
+	struct llist_node node;
+	unsigned int channel;
+	unsigned int peripheral;
+	unsigned int cpu;
+};
+
+static void cv1800_dmamux_free(struct device *dev, void *route_data)
+{
+	struct cv1800_dmamux_data *dmamux = dev_get_drvdata(dev);
+	struct cv1800_dmamux_map *map = route_data;
+
+	guard(spinlock_irqsave)(&dmamux->lock);
+
+	regmap_update_bits(dmamux->regmap,
+			   DMAMUX_CH_REG(map->channel),
+			   DMAMUX_CH_MASK(map->channel),
+			   DMAMUX_CH_UPDATE_BIT);
+
+	regmap_update_bits(dmamux->regmap, REG_DMA_INT_MUX,
+			   DMAMUX_INT_CH_MASK(map->channel, map->cpu),
+			   DMAMUX_INTEN_BIT(map->cpu));
+
+	dev_dbg(dev, "free channel %u for req %u (cpu %u)\n",
+		map->channel, map->peripheral, map->cpu);
+}
+
+static void *cv1800_dmamux_route_allocate(struct of_phandle_args *dma_spec,
+					  struct of_dma *ofdma)
+{
+	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
+	struct cv1800_dmamux_data *dmamux = platform_get_drvdata(pdev);
+	struct cv1800_dmamux_map *map;
+	struct llist_node *node;
+	unsigned long flags;
+	unsigned int chid, devid, cpuid;
+	int ret;
+
+	if (dma_spec->args_count != DMAMUX_NCELLS) {
+		dev_err(&pdev->dev, "invalid number of dma mux args\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	devid = dma_spec->args[0];
+	cpuid = dma_spec->args[1];
+	dma_spec->args_count = 1;
+
+	if (devid > MAX_DMA_MAPPING_ID) {
+		dev_err(&pdev->dev, "invalid device id: %u\n", devid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (cpuid > MAX_DMA_CPU_ID) {
+		dev_err(&pdev->dev, "invalid cpu id: %u\n", cpuid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
+	if (!dma_spec->np) {
+		dev_err(&pdev->dev, "can't get dma master\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	spin_lock_irqsave(&dmamux->lock, flags);
+
+	if (test_bit(devid, dmamux->mapped_peripherals)) {
+		llist_for_each_entry(map, dmamux->reserve_maps.first, node) {
+			if (map->peripheral == devid && map->cpu == cpuid)
+				goto found;
+		}
+
+		ret = -EINVAL;
+		goto failed;
+	} else {
+		node = llist_del_first(&dmamux->free_maps);
+		if (!node) {
+			ret = -ENODEV;
+			goto failed;
+		}
+
+		map = llist_entry(node, struct cv1800_dmamux_map, node);
+		llist_add(&map->node, &dmamux->reserve_maps);
+		set_bit(devid, dmamux->mapped_peripherals);
+	}
+
+found:
+	chid = map->channel;
+	map->peripheral = devid;
+	map->cpu = cpuid;
+
+	regmap_set_bits(dmamux->regmap,
+			DMAMUX_CH_REG(chid),
+			DMAMUX_CH_SET(chid, devid));
+
+	regmap_update_bits(dmamux->regmap, REG_DMA_INT_MUX,
+			   DMAMUX_INT_CH_MASK(chid, cpuid),
+			   DMAMUX_INT_CH_BIT(chid, cpuid));
+
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
+	dma_spec->args[0] = chid;
+
+	dev_dbg(&pdev->dev, "register channel %u for req %u (cpu %u)\n",
+		chid, devid, cpuid);
+
+	return map;
+
+failed:
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+	of_node_put(dma_spec->np);
+	dev_err(&pdev->dev, "errno %d\n", ret);
+	return ERR_PTR(ret);
+}
+
+static int cv1800_dmamux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *mux_node = dev->of_node;
+	struct cv1800_dmamux_data *data;
+	struct cv1800_dmamux_map *tmp;
+	struct device *parent = dev->parent;
+	struct regmap *regmap = NULL;
+	unsigned int i;
+
+	if (!parent)
+		return -ENODEV;
+
+	regmap = device_node_to_regmap(parent->of_node);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	spin_lock_init(&data->lock);
+	init_llist_head(&data->free_maps);
+	init_llist_head(&data->reserve_maps);
+
+	for (i = 0; i <= MAX_DMA_CH_ID; i++) {
+		tmp = devm_kmalloc(dev, sizeof(*tmp), GFP_KERNEL);
+		if (!tmp) {
+			/* It is OK for not allocating all channel */
+			dev_warn(dev, "can not allocate channel %u\n", i);
+			continue;
+		}
+
+		init_llist_node(&tmp->node);
+		tmp->channel = i;
+		llist_add(&tmp->node, &data->free_maps);
+	}
+
+	/* if no channel is allocated, the probe must fail */
+	if (llist_empty(&data->free_maps))
+		return -ENOMEM;
+
+	data->regmap = regmap;
+	data->dmarouter.dev = dev;
+	data->dmarouter.route_free = cv1800_dmamux_free;
+
+	platform_set_drvdata(pdev, data);
+
+	return of_dma_router_register(mux_node,
+				      cv1800_dmamux_route_allocate,
+				      &data->dmarouter);
+}
+
+static void cv1800_dmamux_remove(struct platform_device *pdev)
+{
+	of_dma_controller_free(pdev->dev.of_node);
+}
+
+static const struct of_device_id cv1800_dmamux_ids[] = {
+	{ .compatible = "sophgo,cv1800b-dmamux", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv1800_dmamux_ids);
+
+static struct platform_driver cv1800_dmamux_driver = {
+	.probe = cv1800_dmamux_probe,
+	.remove = cv1800_dmamux_remove,
+	.driver = {
+		.name = "cv1800-dmamux",
+		.of_match_table = cv1800_dmamux_ids,
+	},
+};
+module_platform_driver(cv1800_dmamux_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo CV1800/SG2000 Series SoC DMAMUX driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0

