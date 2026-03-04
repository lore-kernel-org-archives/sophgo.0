Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978433B5316
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633417; cv=none; b=nbO0iSPuK98ze9CS0HqUSzH2GT5uJqvugvDBlGhZkPoM//iuji15aW1D2R4lspmj+4SO47lVSsa7m38MuibMmaA1bTEtbK0ncES2sraVUEpgsdafWL3znpiduHUkCEjDyOQkEq4lCoqTC7CCc4RJOs+w4BiaMRxPxrJ59TvRqaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633417; c=relaxed/simple;
	bh=hZV/UApDi6vbj4CutuxmAun4DaiwUR/7OjFMcmuWnvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=equ2SEYbKaSplLFTBr8UiNmfpUCKCEikZVk1Mv/bSgQXpy7NMODjo6Ry+XDwPdUeFhob8qk0g29RfNrypKYwKOZMrjl/T5XFBcr6xB6UE4JXqaq+XZmSc3Bkigjeog1tFzz07Z9T70ahZE+FpN0bKD1ERKhv03ynY1ZBdL9YCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdpYBqKU; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdpYBqKU"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3672115a91.0
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633415; x=1773238215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=CdpYBqKUkJklBYKzJ9dn/ittfmuHS6lNP3NybWGtb84ss4oqGdCb8ejr9uu/38hD+C
         Lzgao7Bx1JyT7oimBdaISJU9ImwuS8kBkMxBcg0knGcDsJ5OD9b/JwOQ0jtAG5fWJeza
         QRZaP2kiWfgkpAU7b2MOGS6d/yw6AtmX8k+XhWzDjY9tzcDjAULd2HEoIizdmiz7986O
         1AU8dpLrjY1ihGPHK+ONIj8CGlpl1onWKCeUvUEqM6lkc2zEY26+Q2+OTqeOZV0M5v3g
         eIdQ8yE7pCS0wYWIUkHu/M2U7BdFcisKsJ0en5TO2HG2lF9YYEqnoq28ajmiTgkISJeo
         tCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633415; x=1773238215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1R3QVXR/Ozn+9r0kdO5H35rDS/3I0+kFqEdmlZYJAU=;
        b=q0XST7J387MRaIv78Hl8uhrwj+jgc1HnOb+STS6iBwBs6OYJL1wDfbpOsUNzBiX3wG
         svc0QZvHa0B8hTnylxTAWUsNlTx9tALmslilOXuYsBR530kTtA/LjBtAlyGw5AON+C3m
         +b6EwmJJW54FoM6ZEvWmFFxwPliXa2dp5z2IMkYZN5qc5KgLM/1t4dDPfPzoQqQSplPT
         0gRRRHbZ1KaJyVpjIckyQ++DmD3qMJCbVDOM8hRTLfHwk9N1o4SMoNUXIOEPEprMJ+OB
         BbHhFsIG7RVRFVSWq+TB0z98hqat13cIg2F5YZAiBRLyltlxwW+FvwcxZloEYIWB41Sj
         kEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0NuaPrKbf69zXFvFVu8dzY85gelyAQmJNgkoHauPam/jnfWdD92wsiffukoAq/ogqIYVV8qw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIuOhReT2UdWO0iim1wmg2boaOs0k9oujLOxxf8HnK4p/jKkX9
	ThNhV+9X7IoZukf98BMeRQF7odhzN2HRpX3pSN2/elpudYpHZ3mu3o0E
X-Gm-Gg: ATEYQzy/yhowVlEH88Pn7rsbqbDpRfzdhyki1ksH+a3AhqZjX+tGvHWlGxVrgFVJkJa
	wisXDqb8TadhTseDY8zIEkv51gbGetS0K3WbRFX056uIFxOPdlGzC9R7QEjSO+vP2SCrYH8rP9d
	JmkCKjtgjAtiP7V7Qz8zleh4H4WAIoiT41/gCp7PJKAO+W8WlSWBDaXsw4mQlDvu5dV+ODoAfE/
	8f5Gt3mROVxxu/r49FJW/JEXrCvEThpJRYi7iAc+Sb+/B6XrxEN8yLtHxxfP1yPD4bVNAtV6eXx
	rgXR4hit1Dk6Ze/liCv2XB3orh68O1RJE/pmFmD2lRNLu1oFq4s3m/Tk1Te7Ohvq0ehC9/AMH3e
	DKOyUzt/CL2R2PP/T8xp0j+G6zKclgUbb6Tre/C3VgoEIuyCGWjzVWs0KxnX4bnUY0NQ+m5a8uT
	CqMM2J22IVWJ1CrcCpip6y
X-Received: by 2002:a17:90b:2e8c:b0:359:8c89:96e5 with SMTP id 98e67ed59e1d1-359a69caab4mr1729374a91.12.1772633414915;
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:10:14 -0800 (PST)
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
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 08/18] PCI: fu740: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:51 +0530
Message-ID: <20260304140329.7089-9-linux.amoon@gmail.com>
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

Fix the identation of the callback functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 66367252032b..aa6a15baf3fd 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -346,9 +346,10 @@ static const struct of_device_id fu740_pcie_of_match[] = {
 
 static struct platform_driver fu740_pcie_driver = {
 	.driver = {
-		   .name = "fu740-pcie",
-		   .of_match_table = fu740_pcie_of_match,
-		   .suppress_bind_attrs = true,
+		.name = "fu740-pcie",
+		.of_match_table = fu740_pcie_of_match,
+		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = fu740_pcie_probe,
 	.shutdown = fu740_pcie_shutdown,
-- 
2.50.1

