Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71123B3C12
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633755; cv=none; b=awdQT1sB+w9lLto/NSilKPMaKaJV/0i6P14HVztEgxTrSVZyhU+eN2as+myO0TbCOInrLo+xjscd7CIcKgpHyweuuDddl3+xNxu617Bh8vY4FPQrraFpmqhRQbfyIuUEYkv76YSMs+8kQmCpT/AlJjponkABO4MMIj26glL2mB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633755; c=relaxed/simple;
	bh=sOuf9crnr+mGWYcFQULXSYXyooM+1ooss5UP7AG6ldw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEH8exQl4wQG38FJmBMK58F3Wl+TWYlGpsl17zh1ePLh7l6ooWp4Oqlp7qlav6dAherMUeZrglIHQuIoISCBay8FoPXEW/15i+fIYqr2xX0moutF64937bJSH4vv3Qr2jEpsd58cIb02YVXVA3ZRGsod//v/wLf4CDgv51ws54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eljcQwnW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eljcQwnW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso4155896a91.1
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633753; x=1773238553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=eljcQwnWGVf5n2X5pMhzEsULGvP2ZyBNoZ/ZQTOMXFp5XmU2A4CmawUcGbZszJ49A+
         CrCLRWCYvD1kzIllrw+HvAmMBVtRKZNMFTA8Kt0HocuQYhK/gP0wPj5ypGZ+3hZrWVUi
         qrkSYQ2NOFjSkwmn0xZY0K6xfhg8ExxV9dDVeR1rWAFnoldoU4AnbdGD8scyjkX50rRy
         TVvoL+cd4Oj0pekMd/9grhY+kfTt/uP58XBWU8ArDE6s9z8GZsw2v7NGvGkJuVWpftxk
         gD+q7VssrI9CuTuHcHyypEDIAmjysxBLFl/m8wNUlnRiAI7VTdXafnoUj4V56DD4/w1E
         bIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633753; x=1773238553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=nmKNDUqRYkxQO7rB0XKhj6cVP+wH2UTOjJ/2B/YKuUYKZG1aRfbRKkuk2f6h8J+BHC
         WrYX8ehjAp/g/QSw+ExP0c5p3N/Ke7ew4rVs2px4ivpJqjTzxcvapvDjDyDEhJwU3G12
         J81HdwxDqFtaa8RLVAaS4TRmLx3nqRvpY6nNTUABUDER2Rf6umhYa7agotW0Yd87MdmT
         +yR6xrhNg7lfByv2bmein+93tSB1cEkI8IhWu+flc3H59xECuu6B/YhgnQ5ucWR4pEcg
         Za78jx+7GV55UWtGi1ogSPIC8Of55VQZsj1M8TJ5Cs8bHROByEIWjpIuJ6Am2v3XZzhU
         pO4g==
X-Forwarded-Encrypted: i=1; AJvYcCWBx0caKclSLlzU2mzWs/p1Oc908YnwGxCVppe9M1Vd7bfVGkQMP7hLOXOENDn8j+geRwAjdqU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH42DuVN+Qmi/6UAKKEb5JfqvojVG5Z/f9s91AbA5xrtzuMJEt
	HoX2oKQNhpLkD4nQtft9ytdspecPaLoMgDDXlBhWtKssN9ZktyGU80uC
X-Gm-Gg: ATEYQzzdXico4M9iHm2BaHDRAESjyKVNnl8LGk1zwZSyeJG7Xjv32Wh3IHfsBCA9Z7t
	9JexU+RhcoLLbmJI0FasJ/IGi/MbIgPmYQFDvtc+pm0PtdobpmFdgvN3g99/bXRxppgGl1YZdtU
	q8b1d/0Pp2oBkcudIwjrtiCz+5j6glSwAObky14MYkzN5Ac869hWwOXIM4R7Arv+BANSlVPPDi+
	J438C0cQeYE3CluwpqSonE2PVtXDZYSjHeuIn7c3FOrXEv4NFSdYwkzK4EEp7yt8oc9/SPkK7tV
	yF1Cw5UEOvvkUCixkO8gSC8PKK3a56sPFtmUIAmbAsiKI4wVeESbChjK8J8cmYKD4gPoNeLT/uU
	T1QdbYggLilatoxTQxVm2O+58D/71taNh+34rjFjiLM+FGiVM6f1bzEFH+cNhIeulR2V6dpwMfF
	p6OBqYL24mlOESRALqe6mj
X-Received: by 2002:a17:90b:3506:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-359a6a66b87mr2001714a91.24.1772633753114;
        Wed, 04 Mar 2026 06:15:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:52 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 15/18] PCI: sophgo: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:58 +0530
Message-ID: <20260304140329.7089-16-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..0393f4b613de 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -269,6 +269,7 @@ static struct platform_driver sophgo_pcie_driver = {
 		.name = "sophgo-pcie",
 		.of_match_table = sophgo_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sophgo_pcie_probe,
 };
-- 
2.50.1

