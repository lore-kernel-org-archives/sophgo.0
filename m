Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B413AE1B2
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633851; cv=none; b=PBBk/YFiV6byD5VC/hYfi+24AcgDRzYgzxnfzb2IyQqWRfDXkSBYVx9UoQBTQBD0kAzejjYYS+nQ+Uw2IrHVTQTWJuRXn7sGr9nJvcHmqRdgFHNo8h/AVNOsgm3fWwCXTwyNV3zfNaI6rlMr+6ipwfJMpCirJ25QWwe+T3mNxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633851; c=relaxed/simple;
	bh=PwMzJDaYmT2axJpaHt17C/g7mT2QkkzcDRg3A4Uz6ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDD3VUok2M0bgXGmiKXnsm7ArUjfqA1MhdPDe/hglAAOi88SL7fRGGs1d7rYava3m7wbkMCM/X0SE4WxebL30bITFuAFHe2PTIL99zRwSfWK6z95H6BmUb68d5DbhKsyitYxFXE5PioRGwTn0LHlAU8P98BUjiCeddTiWPDubD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAySyKSw; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAySyKSw"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3597fea200dso2821830a91.3
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633849; x=1773238649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=mAySyKSwmKaCgNy6PbP0iHNpuBemu1bn8pU2NRLcC+iXkmYSINV3lVBXExa12lLotx
         pndY5FBX5JuDFGLUppjL9oL/6UDVqo9z/ZHwlAcLy1xcDqkpV1s5votL7bLQQd43KfNV
         0rdGdYpZ+MI5Ij+6SOnnfAIVYipKfuRNWdITFAQhiKgCU/jKywG+GGN9CD0j8L5nd+iU
         NjeLJcYrX6vpIF7w/uJYgWvwOq4BbO3FtmrCqvZOwRGdhlWzERKPBHn/QhqHQJqAR8zq
         8vgC9IUZUVp4uIty8wrV7llS3PlKjYXgF7EPtCTBOh6E7MsU7Q9nEBRyWu5641Uym2HO
         TsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633849; x=1773238649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=wxPsX7y8gVT9XLgKap7vqvVT4RtvCP9NaDW73v2W0fE+RHi8ioQ9Ao5PcjXyvMdf4R
         jdV52lyZ5OJy36rPhPUzIhOopBDG6M7afe3hDZnHOPCYgT66dNFCcW5LeGGhdjRsl2Yr
         N/Gg5lKdLZaYi2dK+wJ++oUrHit+yFYbzoZ8aSdLiYq3qN35NrUMLS+k+JPH9gM6wzKL
         aNvKQikAoECn0iUE6GjgJ0C3Pzdnlo5HUaF8l5Rlm1jIZx/v65dtTGtsTP+cSPZugETE
         URH5zHeXUn5n11Z/xg7EEUMc/9v4HOOo+S/r8C/8GwmoN9mzzKBqqI623k++Q/Lxl7tS
         /+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVFLkTEYRn3aN0+HJmHWnJHlmOEo6ktaiYCN1WorBAwBrBn8+Y7EMiOPzMWktyIwWv7DemVBRY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFDWFPwobLGQ6is5e0K/YJZZHAfTLhTrQRFWPv6mdlwG30TAgA
	E2WIEcNqTvVUxCck6zlGOah3t9HAdv+DlCBAaB1nKzoZwtqg0TdbFS+f
X-Gm-Gg: ATEYQzzJ8oSMVTe6QjvMxH2LoP//guKtBlMFVhl485NdNsL5ogYIvBJynXaYvtE860q
	WUV83yqvf9nWqANgzp7A+2TqfZjdvKy+Y55YwA/rzDHJA+1+SFAi3EJztSUxcgYVDJGHwJVkwN+
	3RUZgiTIGWZo/AA66SOu+8ARDhb84zq2TiEtGgFhlWJbpZ+LipjvTjV5GrQVdZijma9lLn5JhPM
	c8dS9Yj1wcgi9xMni68RYU0DLNaK6Th26OYEYFvjmeYq1psVKrusu9/HpqnwIoStGLrarjWwqb0
	cbqs68vlXJDLunbQl/d9lAL1H2DXes3HoO4pkNKuLA2HKfg302w4wJPzDu7yWCn91NTIir1h1PM
	mJfjyl8BQw7Ls2kef4N1DAAzlt8nC53aagClxTgMROibgMUs9eUfUpVeNgf1loruhy2laaIMTIs
	Fq5WPKUCP3KRufOekquhtq
X-Received: by 2002:a17:90a:d2ce:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359a6a3bc3cmr1764561a91.20.1772633849089;
        Wed, 04 Mar 2026 06:17:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:28 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 17/18] PCI: uniphier: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:00 +0530
Message-ID: <20260304140329.7089-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-uniphier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..53f3bc9f5ba7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -404,6 +404,7 @@ static struct platform_driver uniphier_pcie_driver = {
 	.driver = {
 		.name = "uniphier-pcie",
 		.of_match_table = uniphier_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(uniphier_pcie_driver);
-- 
2.50.1

