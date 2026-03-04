Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7F3B95EC
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633221; cv=none; b=sX79/0+ZVJO2QqrzrWBdpe9mExMd6KPj5G68CSs5U+awB/3ulkR5i7CGD48NG8vxz3Dc6UGgywey0eVoukJGKWJWzh7rgl7bEF88Vntw43Rg1UGZldpp9THSJHGswfhidFY8JN/S9KtZv9p10CgecuajkkGS03VW8UG0pFirQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633221; c=relaxed/simple;
	bh=emXK8/tfYDDxa1P8iYWbMlLlPlfkDwMG4hmrO9QaGWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKFACWERSMF7Ih1AuQaSRinur3hUFB+1SM3mXRynw1wYHFk+AVa2VSeFh99lOYyst0m3FhRn5wGjjFCmRSPKcYV2uPLz0Hcw5R/9izVxYbdAJAkD2ACvD5B1z9n71WqThEERSPG7SRdzGKStWIELWLzFqAEPXjHqPSzKe5QJnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuV/TVkC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuV/TVkC"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-359894e17b8so2379248a91.1
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633219; x=1773238019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=YuV/TVkCCwrigTeef06d8hc6aEwK8rCjur4UF7yID0rPMOxM90sdzm1BHDwrPToJuy
         wJFk1q5FkEMPGPNNZFxOxeSHDmLzsdu1U/u/3btceLMeYrCjR7Wgj2q6lwkAOVtfC+R2
         tv+6vRvzC1D6NkOkM2guyzyoTrrUbbBiF3KoQk++7gtPnbqQ1NtLehkaoMG1WEcnL6Ya
         yZElwRtotJgndExOSQ5QgwDPGlHVh5AcMkJYvry7PCflRlF6p83k7P+89r7CLsAtM2tZ
         78k27zem+atk0AOmw6f/0w4C8i78bIwc6LBw+BcWGWE/xFvB9IZ0ks68Z0wPsy3i9vfT
         wrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633219; x=1773238019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GDiK7aQGiQOGUD0oRaiplszyhTYrKMycTga1oNn5ks=;
        b=w0/X85QJT1Uul/qr4dkQJTYi72vfeX93gziVQ39bMn5bBSVt0dtmNKdfa+bZ9fKdTZ
         /7zr33Fnjw4MsSi/sbQZOEPyOHTmDyBYPqGjxNLlHJVjhwwD6C+JVSfcqNNvsRdsMnkp
         FhRQxFRIF4pK0qaXxwbTorcMeVa2YKS3z1R3zg+/Y5Axboc2KXVypTke9ggU5XIrhlIW
         viFVKXmz0IlkPWujm3Dh2YDZKk8TDfeZcju6taOsmWxJhP0od9t7KIeeNOk5bvYfaULc
         PEKy9esv9sg6ZxNuPbu4DoY8XI4oShEN4PjsXeenhalFvgLQofzUKTYabzo94nYLZdc+
         XnkA==
X-Forwarded-Encrypted: i=1; AJvYcCXp8Daa9CMhyIzwnrkSY+2I8dgYfhaQfrFuMR3bU4H0sHedRDQNa8vQAaCLL0LSjMrUm856M6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvebEL6d47zgx17BYXakH7rnnjUj8uyP1TzzxUd4YjtBvs0A35
	KEbW0w4uxgAeZud9pyXhxUjaIGDhU4UAoHnsEB7S7ahqiUApZAS8Mb2X
X-Gm-Gg: ATEYQzyFGIQOzv5ALZhbnul8AY30kym2nhvn1ri3mIZTWtr2IjwUNjFFfBth5fQB0xR
	dRudlYV9sTaa7HUwK1oylwEIg0iPymHVSjumnecusPmEWz+snuHj6uXNr5rzldiwfbhAm/qGBWX
	O0VP5g487HgUTLhvCcbkrNbM8PSHRMGggUrOCU3nYbMuSeE27qYdOBk5czUDPk+yEbPrbHGV1UE
	QfXo5Bc5OeMkrskxvLkVAO+0hpI8wQbnMkEelFUhF4j7QUMuTjR8j/pHhFUl79SRrYrn4z9YgZE
	nrKrawl2fN7yjt3Nhua6gjX9Qmk/5fS7O/oBstChXxSyHRg0WePP0w6CGQLEd5QueQl1gNEeL18
	1Ki9q+BCLE1w84klua9MCFARiqlb7moXqynisM2nvQJ00h99jTGQCtaHWKNu36R/OOkuaFVOwAn
	WR+ks85ZmasPLaE39YH3PB
X-Received: by 2002:a17:90b:5547:b0:359:7c55:c166 with SMTP id 98e67ed59e1d1-359a69a94e9mr1892448a91.7.1772633219172;
        Wed, 04 Mar 2026 06:06:59 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:58 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 04/18] PCI: artpec6: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:47 +0530
Message-ID: <20260304140329.7089-5-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-artpec6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index e994b75986c3..d8b827926b85 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -520,6 +520,7 @@ static struct platform_driver artpec6_pcie_driver = {
 		.name	= "artpec6-pcie",
 		.of_match_table = artpec6_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(artpec6_pcie_driver);
-- 
2.50.1

