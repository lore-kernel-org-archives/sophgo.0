Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4F3AE185
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633609; cv=none; b=L9OaQDl4bK2dTKjVJVeahndzPgX/hYLllaNh6/jW12J2lhpYGOvS4joq1nefmCzRQfcrBZ9J38CsKpdrnNCfj3NjEHmYreC33ytNxf/Ho1rmchR7lsMrfFkpuK+bxDmod7MZDfjBv8sptLjT5o9GTNGSVlVJme6hM1IJfISRS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633609; c=relaxed/simple;
	bh=hQjxT6/mWIpy+sa8NLac0lsuvVehqMlGMOKEzaLhgSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmN8ObR4aNYrAzkcY4eC5BwU6Kis9Fj5e9pSjcI7xGRCp9qvpOamP8EfP6q3tI5DHd3F8V8BGpZ/LxsnF7xqUa+N6w+FxYSjsIHj/xkS/FcyzUNviqOS3Ktt9Ou6hwJO4pb08hTx0DMlTlOq/wAYRGVITjbMqGkwwbX2FbFS67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Na7yndCI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Na7yndCI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3598cab697eso2002424a91.1
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633607; x=1773238407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=Na7yndCIUSeWHwyAm97SXvUhZ2kgR5p/Ybtr8URh+/H1qA2MKK6WwNxNMm/SBfsiuM
         pzG0eR7n/0tIRj8MmJgSCnJ9+NaTo3/LqGxBta3WyoYAwYXwK1TpIItiPWh1U1R/FHx2
         f+AZQ+admov6bEszqnzxCEniE+7ydlLQbYWjIQQRfjh3e4pnk7tcVpXFVLynSdQneJS+
         8A6C1feZMp+gA3+yoh1nlKZm2zqPqo1mv6GyP46crEUuwWI2Dh7jK4vQVCoTXK/sVxMh
         eWz89gwNVzbUl6+beIBTttWqVVsle8I6uOTbru19TUC+fW4jWG29Vs0YJKbLyA5zai4z
         1GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633607; x=1773238407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDFd5knNMvGZs41+mG0JwsLcBevtPF3DeTcjycQtFwY=;
        b=ifgomCV8COyfOo9EKgdMEkR0xxY6M8+MiOLhWDJSkL6ntt2ILbE/m5Qj5vFp79ftLF
         gL76mCf6ORI8Hi8JbYVUdflojDsfIHaHI80JsAAUfoCzSz88yJWOTkveVC2QB7ett2ya
         KkJg87EWsewlnxY9qw4kMqvr5DZGBuQXQJl99XFM6flIMPN3CsLQTwUk0HKcB6gOt6ME
         Cf55YjfzJTNJiSO7aRrP/05zeo8kk9krTXiUvbmknvItoL8L5t5RsbpiWiUzonLLatdm
         rmiICvxb1XYSsVx6G6vgU/K/6rPDdA8/vdhTzdkOD7jajw7XIQ9vj+1r+3UaWcV1p7F0
         EegQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuiHBSWMrEJurceqUT5NPJpAKKCeNFU6y3zGxP0zVFpa84vqI8dFM/CxLHOvgMTcsE28FDD9I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyfU0J/737+mza+2fffvtCUaU+ZajsRNTP2HND7h5At6QeAx/E
	drQJVVq6gyF3xjXPG4LL3ljJ6aqsnWDQ5JJ0Z4jp/LCY/OUlcEE8qv/d
X-Gm-Gg: ATEYQzxAofyjmbIav1HMxgeHVWttYSlbRV4+U8HahIEEMS+kVuigw77yrN7KWWjUklP
	ZuSPTo1iDp3ae3sp8OcP/5VGVfmbAy5vZXJj9o9wkUOUpd2pFj6oafptN1n3lbnjh2OR5qLBtn9
	9eUSoxrhgrrBnQ+GTJ+MmUED/d+2pBn+2Nt2Z12ouLxPoKZ1aO3BkegeJju2xICAxjdDUsufR6c
	FaLzNRrHZgaoqsTktmxoV09+1isZmD4BieGZ12PvpJOwGgSfeao6ZzBOHbOxPX0Y4U8stbZH94r
	J+Wwv5tBuXuhY3wsYIpELA3ZbfYAOQHzUKhEGJZAXe25pKjudMF+/ixlCzrdMLjy46rHLaVkkfg
	gQlWIiJNYhorYe8/LQiSJnmVlSh+6y0h5C0VGy0JevzE6oALOsg28omAY8B7HP0Z/AMtYuv9jZZ
	pGNgxY9AU+1Vt5NWF442yl
X-Received: by 2002:a17:90b:5286:b0:359:83a3:584d with SMTP id 98e67ed59e1d1-3599ce32dabmr5222786a91.6.1772633607253;
        Wed, 04 Mar 2026 06:13:27 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:13:26 -0800 (PST)
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
	Thomas Gleixner <tglx@kernel.org>,
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
Subject: [RFC v1 12/18] PCI: kirin: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:55 +0530
Message-ID: <20260304140329.7089-13-linux.amoon@gmail.com>
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

Establishing a PCIe link can take a while; allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 91559c8b1866..bc905056a9d7 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -757,6 +757,7 @@ static struct platform_driver kirin_pcie_driver = {
 		.name			= "kirin-pcie",
 		.of_match_table		= kirin_pcie_match,
 		.suppress_bind_attrs	= true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(kirin_pcie_driver);
-- 
2.50.1

