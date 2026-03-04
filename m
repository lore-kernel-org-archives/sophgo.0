Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC663A2548
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633269; cv=none; b=lEr+/LJPYkZmGAji4L0FQJABrzAp99K/pQpy7zfItD+LDD1vS17Xh1PgoGfQOF0nxjgIlECokg/XcRBf7HtPHuOBzbmzNlgPhhu9A09HPq68ij+WcXF+O5V8WfC+RqN9dZ8LJWdqawM4JnjvhuzrE/sLdhn7DY+6TCjpZPT9d5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633269; c=relaxed/simple;
	bh=HhGm9Ohbx6JvMZfjKoxj9JVYSgMdWeij6sbTSI4muf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEM6IZJZUwCp59guplwTO4MFOAg1C9U4JGyOQfJzb6uZWEESyd1VYOfK2Rp0mH1r/nAcxyv8eD7IbLaipETrW6G1Xt1o/Ne3ENgS0Sl2Pe5IwHoedsYl/ybGSt0YcjerAQ8/mogQOMMtBpBVkfNQIte5uuCgfwSYAmkWfuKwOjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB8brsBf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB8brsBf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35983877dc5so1742663a91.2
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633268; x=1773238068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=jB8brsBfgM71f3wUpZn5Ze74GkX3OTPZO+x7q0z8f76ajqaonvmlpGWK0CB2HotyD/
         ISc8j4BEnYWNoOdxHy2kPdtY0z7KCI2lYq8kz3k6C7r0sYPFoYiIx10ZO9lC7rujbQQg
         QUUbXk23v9NmHrtrepc8PtoAvyW6+wvb1OHpDy2P64RNlnK/UuOEX201w375uFYEspEZ
         AdRDhq1wmMZKG5NXN6ou4Qie7rXvSyZt8BQZfK3Bfo5OfLNUlA1WbzGUs8YgCLsUA5vu
         YwtHiYdEB0FwicuNFo5U1gke92rEd20o3XNyEtmdQL71P63b50RWDbnc3BAhWXzsdfxz
         jwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633268; x=1773238068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kpsptxMLAqoswZFWlYkpwOHcyofMbV/CwC4Yy5VaDOU=;
        b=NQ8DSZg/vuBClRbWYhXDLWYkh+btKve4+cs6BRvzlEgHQzarcwGQ8e4v2r6XmT0coj
         WWmVdjH2GtWs62zQ9bsqmsHhcH2pHWbgIwEDToMpiguY+nuXg7Xign33usBxKNcrWnvD
         /TVwob4id6vkQfbA2rY4WssbL0BPu0KEvxmBiH4U8f2R2ySDUHEU1wB1IpY6yJcETLOd
         iZX5mZUXYjkJgKK94HYDkfeAnYqRCiljcp5hwBnKEr8Wu9h0R30yVdyX+9aovOmqRLy3
         Njk++0icSENzKPFiT1Utn45JwZ37NXs/MMhirTI+75WvBfzw0ydgUNjdoSsquDc2uHiX
         iFJg==
X-Forwarded-Encrypted: i=1; AJvYcCXoNC12xDkz/9sZxSS7d1ehosiCaVgWsoi0cy5oWfeOfVk2hUZAh60t1InJ+SQPhZJ8qEppVgA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH8Gd0W21TIkIwNsDy0BMsMk7LOUZmbPLWO9vONhOL6RA0zdiF
	2rZXdNBd91OuXQTib3/dAJI8bIBAucy91Nqp6cjgAomhof8QKP/jvMmq
X-Gm-Gg: ATEYQzz2SAznBFSU8UqLlUiQGB6GrlK7g74C6BpgmaYfZybi5uwutGrczoP5o8MQ17J
	ayL8GgftPjxbyqMHPzrfxEADZapS4Qma7ohULfSjVVni855Jv5xMNgIgoChA47N7GlmX7PU6CzY
	5TyTVmysd+RIUHZByLRIm8FqoWI5tBr2NpVa5W88mbx3GvDbyVlrtfmk5U3fxE3R7F87gzJ/sEl
	FdVhLZrRkkP3AQhOXsAxsuGBlu3TU4TSUk+Wjlf9/f5UgqAjbPXAJxiBY60NBRu4TRMq9qUtAQd
	IDVG2CIfU3pneZtnTr7tPpsB3oaah2q3IuuMgtxDrFVnOf7C9c2K8mOeIAygxpKOxh23P7yhdn2
	DlLClac1gv/xKzy4l5SGCZqQ1nnVXQ+VRxvx9cwNqnF7vnI15ItQb3sYh4KrHO2xSsLra1Ld/sR
	JaZkHGRw06PYmbv2I9A0Rv
X-Received: by 2002:a17:90b:3f83:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-359a6a4a2fbmr1903833a91.21.1772633267856;
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:07:47 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Thomas Gleixner <tglx@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
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
Subject: [RFC v1 05/18] PCI: bt1: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:48 +0530
Message-ID: <20260304140329.7089-6-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-bt1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-bt1.c b/drivers/pci/controller/dwc/pcie-bt1.c
index 1340edc18d12..ef6a3c7fa279 100644
--- a/drivers/pci/controller/dwc/pcie-bt1.c
+++ b/drivers/pci/controller/dwc/pcie-bt1.c
@@ -636,6 +636,7 @@ static struct platform_driver bt1_pcie_driver = {
 	.driver = {
 		.name	= "bt1-pcie",
 		.of_match_table = bt1_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(bt1_pcie_driver);
-- 
2.50.1

