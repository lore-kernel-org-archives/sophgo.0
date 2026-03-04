Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9813B3BEF
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633708; cv=none; b=EebmRIb8+uh8nut4ZKkuo/kGqbzKowTj5W5n0/APv0zBAH+ervNHEWFyQbdTNugM0CXj+VJTvxfOIb8Ank2qL33zD3+gkAIn9s110/YyfFjo5Bw85qaIOlw6H0OyXiuJfTz07bFfYYCeISVkuskJEviL+ru1J0adybczU+xbRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633708; c=relaxed/simple;
	bh=HOw1M4d6fLEqGRM9wuHly7wJbsT2rgQ5OGXMw/g0QY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSEmYufjZ5PEIyFDO+vDeedDlOYXtMnxy9C5IKTwF9uiAe4CDFbM4gHSOROvbZXM8U7IOm3Yni29k8T+Yls7ipFbprlr0k2aM/djIDkK5qof9kvkt3lVytk1Xt5/p6dxpDDj7C5me7Ii9qt97eh/0J4b8UBjm8XMyRYpOxvMgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBzNp/Xy; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBzNp/Xy"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c6e248aa446so2724095a12.1
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633705; x=1773238505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=lBzNp/XyzpsaNR0/CsqtvUdfLrb0xqilM2ocfzSWTdULa2OHN7RqAH0UUw77cMt1ik
         sXTCaZdZ+AAXOnHE3nGaDtYB/J4UznZHlOEdIM/K9D7qn41dU2uptlguz0HSiB1lnRNj
         1WRcELLtcqGvebUnb6PPEsJPIqkfzA1VJfJMwReU1zwlEFOhhEQUhod0y5GlJiFhtjAo
         W2K7vMOEEKmD0HpXQGTqVODEBQJVY54NdsmPjd8vrRjEGY+iRzwEtb7zT7yxuAW8jXW/
         qew831eSKRDYJy0TLpMG9UBJnOQkKUmH7tlpmb10GbjHmelJg6mOqpWOQZxffaagSDC6
         u8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633705; x=1773238505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=OrrTx4zVEme9a51wkOJxH3xzWWePEECUAuV96QU11YC8luMis8AlFxC9yIodDnxxax
         r0cdHPjWu/0ZwxHcD8SHjE9o0Sl+yNSgIaSU1rMU8iORGp/Gh8vaTlMSariV55NeGrEQ
         mIqfHwxhOkvMamb53+KWYCdIN5oGmd0q8qnsDbz/sTufY89ZA7D5twKBM/9DZCfAPnwj
         Q0m6lB4MTBwCZ2cMhSOeYJ2v79PyNAJPKs6R8nobXUoKRSzKhD/xmCWduRkEcaaAXl9E
         7Rj3YKZzGGimL1QPJUA4+2wRMjy6ai+0ogBld9XhT60BqO7Wrtw+1vWtgtljUBKX9tOH
         PqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUMs5GDoWoGyNgE6NRgqQX/vBVPpL71f/nJ4kTX/9sowg09oL31YYENliJXws4SXaOdv+FtU1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YweP6wyWeNGh4h+zg9sQIZAw4kysnjkj9afW37f+16ahwHukdDg
	rBerBqiB9AGh/buUcQyPz0Si2rstTsHC6D5ZZnIvZ8rzV+jGnbYvI5T2
X-Gm-Gg: ATEYQzw7ba5FYacXqZq4Nbc9J1i6kT0yuyvqtmv1RqVaxvwcnWUYnYv5DzlzegbHozX
	8ecKSpaWjqBsDcAyv5n1CV/0N7yrbSmHs4EVD4wzdl1tgGlgY6MoErmKsNWAq7gvbPpcq22b4/x
	S3Is5E76gCsjYLaJU+S2BnQnWrlsKconiQ6yog3GqP2fwEcvctbHGZTwLqI/Swriey9rqgdzF5g
	1DONrOXxY+BSYv2ZahdIF8VUnKGMjBOmSdl+IiRa39ZNwo5v8DEQSRrVbuq8/08oS4NQz8ekng3
	xJiYC5wDuOnIGnk6lR5YYvYOChkYLfKWwvkZL7K9/X61YDF5pXalKOrlLjfCyToXJgVio1V8IzN
	HQI8x+Lfb2Xq1zMvn2TVg8aMxHxf/IRUwfNavVSUsVDitd5US5TGBkMECaD141B4TxA1teStaUi
	9kRcyOCFsCqewKQ3yMR9rD
X-Received: by 2002:a17:90b:164d:b0:359:964f:491b with SMTP id 98e67ed59e1d1-359a69c8cb6mr1870621a91.9.1772633704630;
        Wed, 04 Mar 2026 06:15:04 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:03 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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
Subject: [RFC v1 14/18] PCI: meson: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:57 +0530
Message-ID: <20260304140329.7089-15-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..280146f7b783 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -467,6 +467,7 @@ static struct platform_driver meson_pcie_driver = {
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1

