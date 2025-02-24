Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5D24A071
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391986; cv=none; b=SK5OOzynCZoITM8Co7byt+kUrL4aFNHqUv2SWQk+PiLO5tnNXh2LNQ9wMzFlUhGrab+lEZB8SpPLProGse02h0df7aWiL6IMmz99MjE+L2Yka5dJzWrE8Tuk+2LE2hdJYuyZMpSvIvoJNq6Qf5+6ZRXUmbDsIdcQhJJVcbvuxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391986; c=relaxed/simple;
	bh=vVaDx7z0ZmcYSdZVCynLyZ2AO6c6Mkg760djoI4oB3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPLEKnLcmMPQ4qrP78Lnaa+646bEMbG1e50YnK+dhaVi/df5RIW2moq1yWNKosBHIYKxw1V76WLhEe++GYEGq/7nD/Xnb9IrxB0d0DChDv3r4zxcKOGBqv+z3RuFxT1hFOk6PKWf2/4bGAd+ep591vxPJCKMsXmfyJZ65mpR+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQtSuvBt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQtSuvBt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c92c857aso70402425ad.0
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391984; x=1740996784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9K1JqtTmWf8xTIkMB47iCGqHODGTaRdIkV2ZLfyu+I=;
        b=XQtSuvBtAuELjsHXJUJSFXeGa3wOzx008SNEq0Dl2Xk12d6mcuVZfIVQWm/VOCezGv
         1tEqUzeXoebnA6XsclYDeTWNjEuXZ0OCVo3G3aEfb+u4QhG4ZTaAbf+7VYAcTr/PVUFA
         luX/Iok9UxX473XSDWJepYCDaoFJ1+/U7wTbsGILyNxRiAVZjdbSuRvE90BEZjcrVKlz
         g4314akZ3ZlzUrspeDlaZKgapRc1FrdDW9SCM2gMvcJhAazqsHn7zSmn8anyotLBrsqC
         FlXnwfJvjsnrDYsZp0oHu3mvUk5nxovD4EvI9oBx2yQPFKqe48XPmV/gqib5opqyyUSu
         uf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391984; x=1740996784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9K1JqtTmWf8xTIkMB47iCGqHODGTaRdIkV2ZLfyu+I=;
        b=tbu/PMpxluBbO0w+n7Ce8JdB3AKmQ8FOcXqEHnWDJRRpYyVvUvxsc/P0fM+JOANZol
         jV4QkQ+vyjJtxPyI3IwlykC1lQXH0T3B7JrZd/ZilU52j1XOAzPihfft6PbwKTUlIkw4
         5prIpW4vn6d1cpxk4mzVLt3no8A5v/uwkVIHSYkTijQ4Amw36knpTme+Rsm2YnOvAs0+
         2gsE7rbP09glZB2wFD7Uc1H+A/m+GhNKGdCFA/DUe/B1Z0lvCf+JF07GQO3BDiAdgjvz
         8DVf0Ozk6PKXc8FXSjkYez+1xJhCDJbkxqZo2zsmj2E1bMsu/dUjAhU8aVxmVGxFx35x
         fQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqrbmiom9Y06u+yz/iSoqp4WIaBjVszrInMUCSJ3RwyNhKFZ/KygQ4P7YLegXE1DEVgs59SrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfqqGzshiX/aiZk4k0cNDyF7FlYzrBSxFddvzp6/4jInsQWIZD
	Iv/WoU0JCjw+OsQrghhElmi6ATWxMWg43hIuf4tpqUjLXZt9nQVYFw7GRJZWTrvurw==
X-Gm-Gg: ASbGncuy4pFgqpj3mS1ue786wFw1el3Qt/TQPLPOKJ8ENoahwwPi/23XkWOLiaDizef
	+L79phHlkTYi800f+fixzoOAC4Lv+J1wo0ihwx9W0QugZfAUNKGihtRZVuyLoxPS3DCQmX0ZOzn
	vTS7YRiTPYImurypCXoTTr8CVKrvZXtE+c+QkCVa/c6pdn3XR4AmZDtyCodeRHNhVGomrR9eEhm
	+wH1Je0fkrVblmfI82usOrGanelW4uMS/KxEzq5u3diYOdc1Sg7JOsuweMPRHxY5vCPbkx0KUIi
	B4a/dvv48LRxjROZ7HXN
X-Google-Smtp-Source: AGHT+IHb1ImqlO2BqodvFSOU+dtSSudUpLUD3cK/AcFo/b9Ciwsf44zUCCMrsJc76r+i7ooTlRFeKQ==
X-Received: by 2002:a17:903:2446:b0:215:58be:334e with SMTP id d9443c01a7336-2219ff89cafmr193548465ad.10.1740391983805;
        Mon, 24 Feb 2025 02:13:03 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:13:03 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] spi: sophgo: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:12:01 +0800
Message-ID: <20250224101213.26003-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224101213.26003-1-looong.bin@gmail.com>
References: <20250224101213.26003-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Sophgo SPI NOR controller in Sophgo SoC.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 drivers/spi/Kconfig          |   9 +
 drivers/spi/Makefile         |   1 +
 drivers/spi/spi-sophgo-nor.c | 501 +++++++++++++++++++++++++++++++++++
 3 files changed, 511 insertions(+)
 create mode 100644 drivers/spi/spi-sophgo-nor.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ea8a31032927..6b6d7b348485 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -1021,6 +1021,15 @@ config SPI_SN_F_OSPI
 	  for connecting an SPI Flash memory over up to 8-bit wide bus.
 	  It supports indirect access mode only.

+config SPI_SOPHGO_NOR
+	tristate "Sophgo SPI NOR Controller"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  This enables support for the Sophgo SPI NOR controller,
+	  which supports Dual/Qual read and write operations while
+	  also supporting 3Byte address devices and 4Byte address
+	  devices.
+
 config SPI_SPRD
 	tristate "Spreadtrum SPI controller"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 9db7554c1864..9ded1de4b2fd 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -134,6 +134,7 @@ obj-$(CONFIG_SPI_SH_SCI)		+= spi-sh-sci.o
 obj-$(CONFIG_SPI_SIFIVE)		+= spi-sifive.o
 obj-$(CONFIG_SPI_SLAVE_MT27XX)          += spi-slave-mt27xx.o
 obj-$(CONFIG_SPI_SN_F_OSPI)		+= spi-sn-f-ospi.o
+obj-$(CONFIG_SPI_SOPHGO_NOR)	+= spi-sophgo-nor.o
 obj-$(CONFIG_SPI_SPRD)			+= spi-sprd.o
 obj-$(CONFIG_SPI_SPRD_ADI)		+= spi-sprd-adi.o
 obj-$(CONFIG_SPI_STM32) 		+= spi-stm32.o
diff --git a/drivers/spi/spi-sophgo-nor.c b/drivers/spi/spi-sophgo-nor.c
new file mode 100644
index 000000000000..1139deeac327
--- /dev/null
+++ b/drivers/spi/spi-sophgo-nor.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sophgo SPI NOR controller driver
+ *
+ * Copyright (c) 2025 Longbin Li <looong.bin@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi-mem.h>
+
+/* Hardware register definitions */
+#define SPIFMC_CTRL				0x00
+#define SPIFMC_CTRL_CPHA			BIT(12)
+#define SPIFMC_CTRL_CPOL			BIT(13)
+#define SPIFMC_CTRL_HOLD_OL			BIT(14)
+#define SPIFMC_CTRL_WP_OL			BIT(15)
+#define SPIFMC_CTRL_LSBF			BIT(20)
+#define SPIFMC_CTRL_SRST			BIT(21)
+#define SPIFMC_CTRL_SCK_DIV_SHIFT		0
+#define SPIFMC_CTRL_FRAME_LEN_SHIFT		16
+#define SPIFMC_CTRL_SCK_DIV_MASK		0x7FF
+
+#define SPIFMC_CE_CTRL				0x04
+#define SPIFMC_CE_CTRL_CEMANUAL			BIT(0)
+#define SPIFMC_CE_CTRL_CEMANUAL_EN		BIT(1)
+
+#define SPIFMC_DLY_CTRL				0x08
+#define SPIFMC_CTRL_FM_INTVL_MASK		0x000f
+#define SPIFMC_CTRL_FM_INTVL			BIT(0)
+#define SPIFMC_CTRL_CET_MASK			0x0f00
+#define SPIFMC_CTRL_CET				BIT(8)
+
+#define SPIFMC_DMMR				0x0c
+
+#define SPIFMC_TRAN_CSR				0x10
+#define SPIFMC_TRAN_CSR_TRAN_MODE_MASK		GENMASK(1, 0)
+#define SPIFMC_TRAN_CSR_TRAN_MODE_RX		BIT(0)
+#define SPIFMC_TRAN_CSR_TRAN_MODE_TX		BIT(1)
+#define SPIFMC_TRAN_CSR_FAST_MODE		BIT(3)
+#define SPIFMC_TRAN_CSR_BUS_WIDTH_1_BIT		(0x00 << 4)
+#define SPIFMC_TRAN_CSR_BUS_WIDTH_2_BIT		(0x01 << 4)
+#define SPIFMC_TRAN_CSR_BUS_WIDTH_4_BIT		(0x02 << 4)
+#define SPIFMC_TRAN_CSR_DMA_EN			BIT(6)
+#define SPIFMC_TRAN_CSR_MISO_LEVEL		BIT(7)
+#define SPIFMC_TRAN_CSR_ADDR_BYTES_MASK		GENMASK(10, 8)
+#define SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT	8
+#define SPIFMC_TRAN_CSR_WITH_CMD		BIT(11)
+#define SPIFMC_TRAN_CSR_FIFO_TRG_LVL_MASK	GENMASK(13, 12)
+#define SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE	(0x00 << 12)
+#define SPIFMC_TRAN_CSR_FIFO_TRG_LVL_2_BYTE	(0x01 << 12)
+#define SPIFMC_TRAN_CSR_FIFO_TRG_LVL_4_BYTE	(0x02 << 12)
+#define SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE	(0x03 << 12)
+#define SPIFMC_TRAN_CSR_GO_BUSY			BIT(15)
+#define SPIFMC_TRAN_CSR_ADDR4B_SHIFT		20
+#define SPIFMC_TRAN_CSR_CMD4B_SHIFT		21
+
+#define SPIFMC_TRAN_NUM				0x14
+#define SPIFMC_FIFO_PORT			0x18
+#define SPIFMC_FIFO_PT				0x20
+
+#define SPIFMC_INT_STS				0x28
+#define SPIFMC_INT_TRAN_DONE			BIT(0)
+#define SPIFMC_INT_RD_FIFO			BIT(2)
+#define SPIFMC_INT_WR_FIFO			BIT(3)
+#define SPIFMC_INT_RX_FRAME			BIT(4)
+#define SPIFMC_INT_TX_FRAME			BIT(5)
+
+#define SPIFMC_INT_EN				0x2c
+#define SPIFMC_INT_TRAN_DONE_EN			BIT(0)
+#define SPIFMC_INT_RD_FIFO_EN			BIT(2)
+#define SPIFMC_INT_WR_FIFO_EN			BIT(3)
+#define SPIFMC_INT_RX_FRAME_EN			BIT(4)
+#define SPIFMC_INT_TX_FRAME_EN			BIT(5)
+
+#define SPIFMC_OPT				0x030
+#define SPIFMC_OPT_DISABLE_FIFO_FLUSH		BIT(1)
+
+#define SPIFMC_MAX_FIFO_DEPTH			8
+
+#define SPIFMC_MAX_READ_SIZE			0x10000
+
+struct sophgo_spifmc {
+	struct spi_controller *ctrl;
+	void __iomem *io_base;
+	struct device *dev;
+	struct mutex lock;
+	struct clk *clk;
+};
+
+static int sophgo_spifmc_wait_int(struct sophgo_spifmc *spifmc, u8 int_type)
+{
+	u32 stat;
+
+	return readl_poll_timeout(spifmc->io_base + SPIFMC_INT_STS, stat,
+				  (stat & int_type), 0, 1000000);
+}
+
+static int sophgo_spifmc_wait_xfer_size(struct sophgo_spifmc *spifmc,
+					int xfer_size)
+{
+	u8 stat;
+
+	return readl_poll_timeout(spifmc->io_base + SPIFMC_FIFO_PT, stat,
+				  ((stat & 0xf) == xfer_size), 1, 1000000);
+}
+
+static u32 sophgo_spifmc_init_reg(struct sophgo_spifmc *spifmc)
+{
+	u32 reg;
+
+	reg = readl(spifmc->io_base + SPIFMC_TRAN_CSR);
+	reg &= ~(SPIFMC_TRAN_CSR_TRAN_MODE_MASK |
+		 SPIFMC_TRAN_CSR_FAST_MODE |
+		 SPIFMC_TRAN_CSR_BUS_WIDTH_2_BIT |
+		 SPIFMC_TRAN_CSR_BUS_WIDTH_4_BIT |
+		 SPIFMC_TRAN_CSR_DMA_EN |
+		 SPIFMC_TRAN_CSR_ADDR_BYTES_MASK |
+		 SPIFMC_TRAN_CSR_WITH_CMD |
+		 SPIFMC_TRAN_CSR_FIFO_TRG_LVL_MASK);
+
+	writel(reg, spifmc->io_base + SPIFMC_TRAN_CSR);
+
+	return reg;
+}
+
+static ssize_t sophgo_spifmc_read_64k(struct sophgo_spifmc *spifmc,
+				      const struct spi_mem_op *op, loff_t from,
+				      size_t len, u_char *buf)
+{
+	int xfer_size, offset;
+	u32 reg;
+	int ret;
+	int i;
+
+	reg = sophgo_spifmc_init_reg(spifmc);
+	reg |= (op->addr.nbytes + op->dummy.nbytes) << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT;
+	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE;
+	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
+	reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+	writeb(op->cmd.opcode, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = op->addr.nbytes - 1; i >= 0; i--)
+		writeb((from >> i * 8) & 0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = 0; i < op->dummy.nbytes; i++)
+		writeb(0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	writel(len, spifmc->io_base + SPIFMC_TRAN_NUM);
+	writel(0, spifmc->io_base + SPIFMC_INT_STS);
+	reg |= SPIFMC_TRAN_CSR_GO_BUSY;
+	writel(reg, spifmc->io_base + SPIFMC_TRAN_CSR);
+
+	ret = sophgo_spifmc_wait_int(spifmc, SPIFMC_INT_RD_FIFO);
+	if (ret < 0)
+		return ret;
+
+	offset = 0;
+	while (offset < len) {
+		xfer_size = min_t(size_t, SPIFMC_MAX_FIFO_DEPTH, len - offset);
+
+		ret = sophgo_spifmc_wait_xfer_size(spifmc, xfer_size);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < xfer_size; i++)
+			buf[i + offset] = readb(spifmc->io_base + SPIFMC_FIFO_PORT);
+
+		offset += xfer_size;
+	}
+
+	ret = sophgo_spifmc_wait_int(spifmc, SPIFMC_INT_TRAN_DONE);
+	if (ret < 0)
+		return ret;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+
+	return len;
+}
+
+static ssize_t sophgo_spifmc_read(struct sophgo_spifmc *spifmc,
+				  const struct spi_mem_op *op)
+{
+	size_t xfer_size;
+	size_t offset;
+	loff_t from = op->addr.val;
+	size_t len = op->data.nbytes;
+	int ret;
+	u8 *din = op->data.buf.in;
+
+	offset = 0;
+	while (offset < len) {
+		xfer_size = min_t(size_t, SPIFMC_MAX_READ_SIZE, len - offset);
+
+		ret = sophgo_spifmc_read_64k(spifmc, op, from, xfer_size, din);
+		if (ret < 0)
+			return ret;
+
+		offset += xfer_size;
+		din += xfer_size;
+		from += xfer_size;
+	}
+
+	return 0;
+}
+
+static ssize_t sophgo_spifmc_write(struct sophgo_spifmc *spifmc,
+				   const struct spi_mem_op *op)
+{
+	size_t xfer_size;
+	const u8 *dout = op->data.buf.out;
+	int i, offset;
+	size_t ret;
+	u32 reg;
+
+	reg = sophgo_spifmc_init_reg(spifmc);
+	reg |= (op->addr.nbytes + op->dummy.nbytes) << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT;
+	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_8_BYTE;
+	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
+	reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+	writeb(op->cmd.opcode, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = op->addr.nbytes - 1; i >= 0; i--)
+		writeb((op->addr.val >> i * 8) & 0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = 0; i < op->dummy.nbytes; i++)
+		writeb(0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	writel(0, spifmc->io_base + SPIFMC_INT_STS);
+	writel(op->data.nbytes, spifmc->io_base + SPIFMC_TRAN_NUM);
+	reg |= SPIFMC_TRAN_CSR_GO_BUSY;
+	writel(reg, spifmc->io_base + SPIFMC_TRAN_CSR);
+
+	ret = sophgo_spifmc_wait_xfer_size(spifmc, 0);
+	if (ret < 0)
+		return ret;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+
+	offset = 0;
+	while (offset < op->data.nbytes) {
+		xfer_size = min_t(size_t, SPIFMC_MAX_FIFO_DEPTH, op->data.nbytes - offset);
+
+		ret = sophgo_spifmc_wait_xfer_size(spifmc, 0);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < xfer_size; i++)
+			writeb(dout[i + offset], spifmc->io_base + SPIFMC_FIFO_PORT);
+
+		offset += xfer_size;
+	}
+
+	ret = sophgo_spifmc_wait_int(spifmc, SPIFMC_INT_TRAN_DONE);
+	if (ret < 0)
+		return ret;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+
+	return 0;
+}
+
+static ssize_t sophgo_spifmc_tran_cmd(struct sophgo_spifmc *spifmc,
+				      const struct spi_mem_op *op)
+{
+	int i, ret;
+	u32 reg;
+
+	reg = sophgo_spifmc_init_reg(spifmc);
+	reg |= (op->addr.nbytes + op->dummy.nbytes) << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT;
+	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE;
+	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+	writeb(op->cmd.opcode, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = op->addr.nbytes - 1; i >= 0; i--)
+		writeb((op->addr.val >> i * 8) & 0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = 0; i < op->dummy.nbytes; i++)
+		writeb(0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	writel(0, spifmc->io_base + SPIFMC_INT_STS);
+	reg |= SPIFMC_TRAN_CSR_GO_BUSY;
+	writel(reg, spifmc->io_base + SPIFMC_TRAN_CSR);
+
+	ret = sophgo_spifmc_wait_int(spifmc, SPIFMC_INT_TRAN_DONE);
+	if (ret < 0)
+		return ret;
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+
+	return 0;
+}
+
+static void sophgo_spifmc_trans(struct sophgo_spifmc *spifmc,
+				const struct spi_mem_op *op)
+{
+	if (op->data.dir == SPI_MEM_DATA_IN)
+		sophgo_spifmc_read(spifmc, op);
+	else if (op->data.dir == SPI_MEM_DATA_OUT)
+		sophgo_spifmc_write(spifmc, op);
+	else
+		sophgo_spifmc_tran_cmd(spifmc, op);
+}
+
+static ssize_t sophgo_spifmc_trans_reg(struct sophgo_spifmc *spifmc,
+				       const struct spi_mem_op *op)
+{
+	const u8 *dout = NULL;
+	u8 *din = NULL;
+	size_t len = op->data.nbytes;
+	u32 reg;
+	int ret;
+	int i;
+
+	if (op->data.dir == SPI_MEM_DATA_IN)
+		din = op->data.buf.in;
+	else
+		dout = op->data.buf.out;
+
+	reg = sophgo_spifmc_init_reg(spifmc);
+	reg |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_1_BYTE;
+	reg |= SPIFMC_TRAN_CSR_WITH_CMD;
+
+	if (din) {
+		reg |= SPIFMC_TRAN_CSR_BUS_WIDTH_1_BIT;
+		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
+		reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
+
+		writel(SPIFMC_OPT_DISABLE_FIFO_FLUSH, spifmc->io_base + SPIFMC_OPT);
+	} else {
+		/*
+		 * If write values to the Status Register,
+		 * configure TRAN_CSR register as the same as
+		 * sophgo_spifmc_read_reg.
+		 */
+		if (op->cmd.opcode == 0x01) {
+			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_RX;
+			reg |= SPIFMC_TRAN_CSR_TRAN_MODE_TX;
+			writel(len, spifmc->io_base + SPIFMC_TRAN_NUM);
+		}
+	}
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+	writeb(op->cmd.opcode, spifmc->io_base + SPIFMC_FIFO_PORT);
+
+	for (i = 0; i < len; i++) {
+		if (din)
+			writeb(0xff, spifmc->io_base + SPIFMC_FIFO_PORT);
+		else
+			writeb(dout[i], spifmc->io_base + SPIFMC_FIFO_PORT);
+	}
+
+	writel(0, spifmc->io_base + SPIFMC_INT_STS);
+	writel(len, spifmc->io_base + SPIFMC_TRAN_NUM);
+	reg |= SPIFMC_TRAN_CSR_GO_BUSY;
+	writel(reg, spifmc->io_base + SPIFMC_TRAN_CSR);
+
+	ret = sophgo_spifmc_wait_int(spifmc, SPIFMC_INT_TRAN_DONE);
+	if (ret < 0)
+		return ret;
+
+	if (din) {
+		while (len--)
+			*din++ = readb(spifmc->io_base + SPIFMC_FIFO_PORT);
+	}
+
+	writel(0, spifmc->io_base + SPIFMC_FIFO_PT);
+
+	return 0;
+}
+
+static int sophgo_spifmc_exec_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	struct sophgo_spifmc *spifmc;
+
+	spifmc = spi_controller_get_devdata(mem->spi->controller);
+
+	mutex_lock(&spifmc->lock);
+
+	if (op->addr.nbytes == 0)
+		sophgo_spifmc_trans_reg(spifmc, op);
+	else
+		sophgo_spifmc_trans(spifmc, op);
+
+	mutex_unlock(&spifmc->lock);
+
+	return 0;
+}
+
+static const struct spi_controller_mem_ops sophgo_spifmc_mem_ops = {
+	.exec_op = sophgo_spifmc_exec_op,
+};
+
+static void sophgo_spifmc_init(struct sophgo_spifmc *spifmc)
+{
+	u32 tran_csr;
+	u32 reg;
+
+	writel(0, spifmc->io_base + SPIFMC_DMMR);
+
+	reg = readl(spifmc->io_base + SPIFMC_CTRL);
+	reg |= SPIFMC_CTRL_SRST;
+	reg &= ~((1 << 11) - 1);
+	reg |= 1;
+	writel(reg, spifmc->io_base + SPIFMC_CTRL);
+
+	writel(0, spifmc->io_base + SPIFMC_CE_CTRL);
+
+	tran_csr = readl(spifmc->io_base + SPIFMC_TRAN_CSR);
+	tran_csr |= (0 << SPIFMC_TRAN_CSR_ADDR_BYTES_SHIFT);
+	tran_csr |= SPIFMC_TRAN_CSR_FIFO_TRG_LVL_4_BYTE;
+	tran_csr |= SPIFMC_TRAN_CSR_WITH_CMD;
+	writel(tran_csr, spifmc->io_base + SPIFMC_TRAN_CSR);
+}
+
+static int sophgo_spifmc_probe(struct platform_device *pdev)
+{
+	struct spi_controller *ctrl;
+	struct sophgo_spifmc *spifmc;
+	void __iomem *base;
+	int ret;
+
+	ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*spifmc));
+	if (!ctrl)
+		return -ENOMEM;
+
+	spifmc = spi_controller_get_devdata(ctrl);
+	dev_set_drvdata(&pdev->dev, ctrl);
+
+	spifmc->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(spifmc->clk)) {
+		dev_err(&pdev->dev, "AHB clock not found.\n");
+		return PTR_ERR(spifmc->clk);
+	}
+
+	ret = clk_prepare_enable(spifmc->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable AHB clock.\n");
+		return ret;
+	}
+
+	spifmc->dev = &pdev->dev;
+	spifmc->ctrl = ctrl;
+
+	spifmc->io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ctrl->num_chipselect = 1;
+	ctrl->dev.of_node = pdev->dev.of_node;
+	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
+	ctrl->auto_runtime_pm = false;
+	ctrl->mem_ops = &sophgo_spifmc_mem_ops;
+	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
+
+	mutex_init(&spifmc->lock);
+
+	sophgo_spifmc_init(spifmc);
+	sophgo_spifmc_init_reg(spifmc);
+
+	return devm_spi_register_controller(&pdev->dev, ctrl);
+}
+
+static void sophgo_spifmc_remove(struct platform_device *pdev)
+{
+	struct sophgo_spifmc *spifmc = platform_get_drvdata(pdev);
+
+	mutex_destroy(&spifmc->lock);
+}
+
+static const struct of_device_id sophgo_spifmc_match[] = {
+	{ .compatible = "sophgo,sg2044-spifmc-nor" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_spifmc_match);
+
+static struct platform_driver sophgo_nor_driver = {
+	.driver = {
+		.name = "sophgo,spifmc-nor",
+		.of_match_table = sophgo_spifmc_match,
+	},
+	.probe = sophgo_spifmc_probe,
+	.remove = sophgo_spifmc_remove,
+};
+
+module_platform_driver(sophgo_nor_driver);
+
+MODULE_DESCRIPTION("Sophgo SPI NOR controller driver");
+MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
+MODULE_LICENSE("GPL");
--
2.48.1
