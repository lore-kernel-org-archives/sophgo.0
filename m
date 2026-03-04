Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64653B8BB7
	for <sophgo@lists.linux.dev>; Wed,  4 Mar 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633512; cv=none; b=kd+LC6tpUPyHSCsNPjQ1j4QTHxliy0ICRPEF/4Z7C+D7F+tqVnCB6agGyES1udGBfQ17zvBuIndea+TnMINeomjuMMIsO35RQuw7k21os+FJUOrezB5J3fBOM9KhJ18tzwfR4/1lsHrtjii41IQYzp/07nXab4lMmeW26uuIzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633512; c=relaxed/simple;
	bh=sHoTROKxYE1tGVUpJLWua74R0Zndw2ipLQTGkl+pgQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTALzhtbLdbbfu/L+9U5zUthcdQ2w+AWajFA2Y+sEcMOmEQ8DWXRtZzUNgeasT28oqvkBmQQLeMvObttGPoZwce51MPHUD4MPoLOVfAzDtBUj3yr9Y9y2zg5rOJ0snhsVUusLD49Mdq5YN39DhkabwBJxZR24rvj7BOD9pJJ1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfMZdi2p; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfMZdi2p"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso2539673a91.2
        for <sophgo@lists.linux.dev>; Wed, 04 Mar 2026 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633511; x=1773238311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=XfMZdi2pKuNeqBqHAq7ZAUv7NZ5c0WxvEgLai+dTDIEEWPWndG+Hc8krc9jVCyH14A
         5vl4puA+y6fiBBSBdW/vs1bDB/B2KuNdWe4o8WmyBmYEUjcsCTrI3yaGuqBGveOg9JOd
         LCOL5AOpK0InxzBIQZq2XMQOtM8V1t7aVVtnFdh7kbZRWh9GF4dy5C+q1mnoqVvDVskf
         ei3Db3CxYb5p6zb27rxX+tVR+BnCKHPA6XbYK5OTXED5+WAvd2F273QvULGsXjn0ZEGG
         zibuaNLZY1M7oOz25J5evreNIPoNvQSW4BQz4Ug6gNKA2UYni8wOXpI1Q3G+sLT7xCsm
         iWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633511; x=1773238311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aROfauUNCfk0cLD7hgwZVAJeImYUlQkQwfOgm/TavYo=;
        b=rHD5wiMOF/cyvxVDNmXxtyv+4i8/G0z0wWrcmLrBC4YZfLrmElc4nzTW9KEFn3WXf3
         LrYB+LZQDvuHi2ptnMDvQsohhAsEPThAmcYMYejpPG6c0dPn5WJOOOkZmZF6VFVvO+2E
         edYXCOv+5TzTnsjVtGc0Fg10zw9H3vueUtwS9ZD4yGMzeB2kWY7pUmj7+uLjvDqeBa8U
         OgrRFNh3snC/DQrR83T/G1ZNN1f2eNWz6/t8aMMal3mMBAdABZDvQdOltu4RoM/mMji3
         LMiJmqGWRCqdWlI8CxibkXC2fiKwlccKal/fJsMZDa6f9LrLH2HHD1EKzNbd58Mk1m2F
         jh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh80LBMVCOqcC2s1rdDeUQIoarYc0XhVYkYTM1XrZjBU7QRsFzBlJhnpPLOk5pQUYkvQKkbns=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ9WP79r1WAkMgnnTHEyc5cAolvb1695patZyhTuEdgJc5MdL4
	9yD8o6WOk57nDqeur0WiVy/Ib23ZivWHcuwuDoskdwrUB0sFgN0pC0P6
X-Gm-Gg: ATEYQzy9hPLYQH9Kq68hUma7xfyvElqprxVuAPCnOxMh9FFrqiiD9oa2vIRTJBmRdrd
	L8u+vQ8TAG9YR/5MlakIUcxhUFRbbdrZa+2n9CjiNSJlbJyMDqjBYovFvizBCllPI8wcluze4qG
	rJQCLrL5CI1KVMnz2epo2D1Qb7HF8wwo87YUYEkmQIE5/NbIQIs76d2rFvYlHls+Etpax5Cwmpw
	b3S0QHPsK7TjlWyGtV9MzKzvQuqYHJSJEplpfI08ZY34n2lvxzGc4MhbZVf6ozIj8BJaKglz3px
	VigskyGWbuqjRbuRv2YDV86rGaclg8uH6wF6D7Og240yCyTRZBGnDe17z7H7tYtDW0Tsc5jAlS1
	N8NTxWh2/rjrEGJR43AD1C0Cx6OOoIsBSp5i/orR65FXO6L57m+TOvWySmXtOzQenXUlrx271pR
	R/4nyISzIv9ua0G7tMsEKMAbf8cQ17Z3E=
X-Received: by 2002:a17:90b:4e84:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-359a6a575e7mr2125758a91.26.1772633510992;
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:50 -0800 (PST)
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
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
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
Subject: [RFC v1 10/18] PCI: keystone: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:53 +0530
Message-ID: <20260304140329.7089-11-linux.amoon@gmail.com>
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
 drivers/pci/controller/dwc/pci-keystone.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..b5c0c690593e 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1351,6 +1351,7 @@ static struct platform_driver ks_pcie_driver = {
 	.driver = {
 		.name	= "keystone-pcie",
 		.of_match_table = ks_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1

