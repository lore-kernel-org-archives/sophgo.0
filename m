Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C593B8926
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633174; cv=none; b=bBXDOLLzraEYuSpFlX6msqpq4wjxVLe8Bwl2FnIGnpQSCUi9ygOlxDm+IzxiaEWHWP/IRMem5s8p+Iq6kR282FPx+M/7LkGE/FBno6GGMamYS9/b7xmcOHEZSqk7FfFG+7F02QZK7aFb8t3PeZBpxPi1AiGmZtTPBjcWegedbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633174; c=relaxed/simple;
	bh=IoX1lY8Yyzmbm1I9IV2ELUEQxT0pxCd3QQREluW47Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9KQzX0NRDBsX8wHsWH1C89y7KVX9uRWnofVgFqFYGNch/icObUDxc6RBhgnh8a4ceVhCJu9W1eN8Q9FWt9z80sQ9Xz+pX+aWOb/C5kkl7QKvmjjXSwLi1lIaMl5w/0EsdChuvK8BrrQJqQ7SuvNwua1WZ5QAzQWgGsjWpewszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoLm9A2A; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoLm9A2A"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1400671a91.2
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633171; x=1773237971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=RoLm9A2A+CEmLCytIlQh4obuoVzD4UZniT/xlODZ91PZ5MYHFwQ7aCAc28wbsQKPgu
         5sAaq8wUjlhWcQgJnFChAgbUWTLy4dvEB5jNgl70Qaw8IngPkA8KkkPb4vPoPotu/eW2
         DfGU3EgHlTEliRIrl9L0CCMuAmpeGbtvXiwPZGbEmn+WFzi2eASuhnj33vsfcmh2xKNf
         w/GmZi0jP9A8movLv0Jn46LTrjFSv0kWzuS0wZ9QBlPmqrwdE9Qv3rGUbpPyhE9AIajx
         tye0z5WuteB120PteWrUaY4DkKYQpa7fnwiJ6Nff796JqwMa3lQgduxSYo1l75vAaU5s
         7a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633171; x=1773237971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=eTnHv2Ps40iTBGBDK4XUgFgoMES2l8mwHp+lOIFBpT+9Aqn15ZmICPA1qUKQcCf7g0
         daSqKg6EyqVrlaGv2etgXSjFEVXy55StRTzkAu8NugtjQvX/7POIOO7GnGNsV8oPKnjE
         vyFBwVV/rzj9+3dPx10zRTbCaJEijQT8KqU8cT9CkNunZclUYfGF/6FBS+hnXEzlCO5P
         b7XZh51CfZbOTycMcQWHdmImHmM0YiXH92/3RQV1OMgCvi/+rVMwVQNalh4Yt5w9BH5R
         3ECM0Y/I6sDhRxGkkghnG6AfAVeD625ZBG2+udzv7ruCC6xRkurKq/YSBYFr6Iw6YBLM
         +myw==
X-Forwarded-Encrypted: i=1; AJvYcCXr+C7hC1oTKHRStogMuP6Rcdv6+FYRfpDUk4qw3TGQcA1u/JXj2s97lmziIyd7M/c2s23XaTk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxteRQoQ58OtfakLCBZjlkRMPAI8lRsJ7ZL9S9mVCBdMF2idwRB
	TvEh3d5oqQXWTaJoxsYLXrBojTEmfTQqABNL5T4royBmzzCb0T4FmWL1
X-Gm-Gg: ATEYQzyhinI1DCcucgD37DHalUGQOoyDQse/zBiMF0r3jiJyk6v4U8x2X7ya1VsBrtC
	MRFycyxQwREpP28BH7dSKHB31Z5m04NiRlZOQ90+dqZnS4Z30CXlhxIw3Uoi6/1Xs+CD0OdB7dn
	ZkihyKpkQ88z8vZgwCNOLoe0tyEyhOhCaQvixiTdKyIJ//at+aYn0Qd6dU2dJmXtwZ5VzVwd3qu
	cHOCIri2beOFPVP4SYbAE9y3dEBQREz6WuitDl4wpjGl7+gyzdCbrNgNoi1AF7K5AFB+Sv37Zyk
	4z4kiYqtjYp0hvSnwnDCHmA86h2r/ZSMUgRR6YfWz2/AWxLaoyXdZFv763L0As4D4Bi0fgpjAcH
	3eClL7syW9m85cVWyFOKFyKKdw38hM+s0A9hAO/okFCTjSNlhYvRG1q1Ri672BFDTazmY8kXnlV
	vtqjfGmcfK5czNatHVgzDqZfWVBBPjfYw=
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id 98e67ed59e1d1-359a6a66a94mr2076415a91.23.1772633171145;
        Wed, 04 Mar 2026 06:06:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:09 -0800 (PST)
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
Subject: [RFC v1 03/18] PCI: armada8x: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:46 +0530
Message-ID: <20260304140329.7089-4-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pcie-armada8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index c2650fd0d458..ffb5554a2a8d 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -344,6 +344,7 @@ static struct platform_driver armada8k_pcie_driver = {
 		.name	= "armada8k-pcie",
 		.of_match_table = armada8k_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(armada8k_pcie_driver);
-- 
2.50.1

