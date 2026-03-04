Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F353B7B96
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633465; cv=none; b=nUdyx1d5XOBflEDVz9yWdGrvPfSpogjzJH0IQQ+CQ+v7fOIjp4I8hPvozd60a5f18IRdmUS+ds+0ewSVHtBoz9eu+ToqIcR2BmNNXdAonsFiQvTixQH+ihZqYA7aEi9kTadrAaCYpRWViV/TBUN8Aa811u0cLe7y0pWnFfVhJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633465; c=relaxed/simple;
	bh=dGHDNG1M30BMwVefPBCW8ENkGd1Eu9rEV3i7SZBHTKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5PUKFRY9cYeFU5otj6gh5RAhd2b+Vk385svU3eko8tsisyQziSZazNKo4Ulh9D63ccySdKQfgmnaTu6NmiWplFAiEwqk56+uZbBSxuw0wOFi6q6tvqHoTfTi/bo1n57aWof5iWzcIsItjh3+vmqr48m3K+nLAnrUs5LCZjjZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBSNerdD; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBSNerdD"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7388fb61adso30872a12.3
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633463; x=1773238263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=XBSNerdD2rGeEkZDODBsn6UgPs/anyMb+g08/L3DANquYyqvd05oAC/aMIIRNkj28U
         f1V0iZ5zZbNDaXtm1v/nuS/vEv73frOp+d5cf/3GS1Ea3IakpTp15fAxV9sdPsvypTPy
         Nju2mGVUKNdM6d3scWTscD8IdEozplwwPNXAH+KH7Qcl3+yvPEgi9idHRz76bn3++Uew
         z9vieK5pJ8OU1/o5WISqJ+evlE+fVTBOYaADeoXCURT7sgExFOBN5Pzur2u0/tBNZ3TU
         n1gicNcPLUnH0IBULQyJNU/DAT/cROC43XqYI3JTJamEGAw+VojGV9EOPLDxmf2D0aAZ
         b2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633463; x=1773238263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=Va7+U0zHczR+jgOTEoq7SDhUbLW8Nb+kJ2Fe4Sx2CiEXXtr13bauHjaenvpQ90Ob04
         OJwawtAqadqwJUFscRdGRPOOpYDpuOJUUlrT3+cZMRvvHuNz2O+1ktNRXvtNVkt1f1IL
         Ls60AAN/iUj+Nxp1U4koQ6ynAmMYFR5Sd3whZ0ai8MZEtBp99ioPh2Dn7wmCCDa/rnKd
         wRnNiWLavhf1+jBNNUXhz3QrNbvv/AvceaIChER1qFsKOdZnprkmRdchuTs2yvWI7gP5
         JE0bUfdRwoFjMSRNuBV5Xe9u7fnzNZXYFpufN9kC2HfTqseP+aUvJ96RwqyGIMb4sVgH
         sRww==
X-Forwarded-Encrypted: i=1; AJvYcCUAvs8zDYPFmTH2+4UqTnKFxtNOjBahQrUoeIKjTi+cjxEgzdLvJpbmoB4RYST/cL7HSOwBnOE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2vC/FDniyhcfQwe9lU3VLbooNDnaYRTWM1VS/XSub2rsvwr6V
	PB1tRtFLxuvW59fEPvhbJd15D3/dpRaYWVIZkojyxS89m2mYrSr6cjWp
X-Gm-Gg: ATEYQzxdN8JAc9QO+3MFlnnl+Tgrf6QwaZ/rzWJf6BVe05h18IWZZtfA4py4gEV2wXE
	u3lZsugd7RelZu/b6Fk98+2diOEu1ffYlJe3uwYlNbC5DS06biQlGcESoE+Ft8JA0qKUns/Rizw
	SdvT4LKTqa5wSTjo5qC3mgmJAhOq/rnJyt382h+RlOdH153TyAO486tdSCRx5oixLfso5ybSK11
	hDE2Wy09r1X5GYTf37l62uNQvYk/XWldPa3PIZ1dvNPTO/hrTYzEp+SfjpXOo5k2DygtMkzQRQp
	AkkfmO60NKoOhwEpbJ+b7BvtmnpHEl9AzVjW5/iTdHz2cGyIvcbhq1C+CgUA9agKdm+ukGc1vhn
	k5uEs8sHmzanoiE7YFh5VMtgtGO/sj644l+sC5z87mgvxtaziqpTGIo7DJaFHWl/vbsDMPpNidb
	lfh24Y8fhivSmKITAkQcqN5MXt4ydPuTw=
X-Received: by 2002:a17:90b:510d:b0:359:8c63:8ff2 with SMTP id 98e67ed59e1d1-359a6a4f880mr1548752a91.22.1772633463114;
        Wed, 04 Mar 2026 06:11:03 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:02 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 09/18] PCI: intel-gw: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:52 +0530
Message-ID: <20260304140329.7089-10-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-intel-gw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c21906eced61..bc5d96dc12bf 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -442,6 +442,7 @@ static struct platform_driver intel_pcie_driver = {
 		.name = "intel-gw-pcie",
 		.of_match_table = of_intel_pcie_match,
 		.pm = &intel_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(intel_pcie_driver);
-- 
2.50.1

