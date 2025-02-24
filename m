Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86DB24BC0B
	for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391993; cv=none; b=J5dOsJ/t1Q8UdbbCidyODKTUQPaqCkQ/mVLnbitump9SLC3SONKmw+qIMBDo81C8yt3KoxYgH2ThvO3DvvqGs1BkM84s7I1igyo4SxR1Y/tklc7xDZfsrlVhHzLlalCxswOUKKBNFoYHYi/WfpQzCaeXfjZ6unN2Zr6peNuRvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391993; c=relaxed/simple;
	bh=DI/yU4Ha2m1hI+3q6R4XXFjNeHmAswCQiwUL6XQGzvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJyxdu4GOabJvb51gMDf+IgKCF/QcBfW7uSu5S9WHrsEiUmslujr5elSqglZBq6/jjMWR7oqBngNLrjyF8zDPx4v8NjyBDfA7rJVoZw/yxar1JtCCSQ8C47sZwaJ/O25Mm8ai+YRA9YimZgAoFUw7zordquP1ZxUhvNCyxEqY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgEj86Kp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgEj86Kp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-222e8d07dc6so10409265ad.1
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391990; x=1740996790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHH1Bo2ngh238ZBojTHJqWRsImuzKw7MT/RetGGhdDs=;
        b=OgEj86KpSusfNpO18xZvPK4TH2Qm2XarmKHVPW2mOh4ZIiRtzsRzdkkcCebt+iYk0Z
         /Mb9KEG2WM7y6j6tmcp8ZJdnR2RvyApRN6UMz+wb4skidwDL2w4OVv8DvER888Crrfjs
         S77P/BCzh78ejjfkFq3A7OgcxwVsJYGeUxVmFqYEUjaqEO4aC0l7618LBWpSFQTvCmTZ
         4f/5d6veOHZPS8rXbUKgDu0xxvk+j2bsyPhAoaAL3TevCjAsOLuogciQHY1YKPjVWWQm
         bYn6c5246HIUMZpZjakiBlyfVNAyEl7WRieo03olOmN7JeEPoE0XZtsocDLBSKd/lVYM
         +9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391990; x=1740996790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHH1Bo2ngh238ZBojTHJqWRsImuzKw7MT/RetGGhdDs=;
        b=HQlG0/N3kDbxxdbRGsZVa4LAfePtSPk3McAGoPfHcmGXRI0zE9lc5XSLA5JBDQoLEp
         23pvL2X92oecyF0LEXVVuw9+v/dFyEmzBObn5vQWHw/0rCwS96gKM0NUQ5gp9j/7jbWO
         lJPweTw0hoJlqw1mBrRuhUJxobrecYVWUNKR5Mf+kCRzgOJDDqcPnAuukzqQv6QlfjBk
         h/7KjMWlDGaxNfLTqhFa7C62ksJCTu+tbEnS4CGNp5V7keuq0pusIsqyy3/1iMS4UszN
         XI8wkHrdClubj6gGlEDTjz8ONI4w/x9JPRqbKaYDxrh8mxhb2qaN4eH4ZOG0/9jKmKe9
         f5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgbom4BDL+Lfv+vw/ir7NxBP3RWYrhaSCWC0js5Qo/ZcJsEW4rTI9fA/f5UXjrfFaby8n8DMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTW7M/8XED3bgZIDF3DOZ1vgWWByj+SrIZSkWn2o1aHPKGwyJ1
	B/SHlROZLeFDgdecz6tGCy7+i7IJcf2mjr1BGcWADKr3JM99vWhCeqZZfVvZNMz1jA==
X-Gm-Gg: ASbGnctANNnXw/2R2ID1+QmleYocvFZs7OHQQiIG6Jv7Yh5Ali6cpdE2tebdXmnwt0K
	KaCYxBeqQHr9SC39aHpDLdUgFfWN0Ykt0QmYQOhAdsW8sDUCMM4O811ZyjxmUsYWLhMpDP4eCvY
	uBhY1bR0pdZ9c93Sr5nBPaCpTHU+jhJN5uXb0Z5rjvkSkCgynWE8xLaV33ykwMOlb9e42JRuftE
	2sEdp0L8pu2YAFcUr6f3BYX0ahwNsrvUM4xMY9PyexnAHtlKg2oqg+E04JyuNLrgOq4fqUGR1V8
	DiJ0TGG6i2hka+g7OL0F
X-Google-Smtp-Source: AGHT+IGtCyZFRUi+gbIX4aSNZJGXzCxJh7yxdOzB199I7UFF6fkdtprcsgYmp8oGaKiLKViiu8/0JA==
X-Received: by 2002:a17:902:f547:b0:215:6c5f:d142 with SMTP id d9443c01a7336-2219fff87c0mr224305655ad.20.1740391990140;
        Mon, 24 Feb 2025 02:13:10 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:13:09 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:12:02 +0800
Message-ID: <20250224101213.26003-4-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224101213.26003-1-looong.bin@gmail.com>
References: <20250224101213.26003-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SPI NOR device node for Sophgo.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  | 18 ++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 24 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
index c50e61a50013..9c634920f37e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
@@ -80,6 +80,24 @@ &sd {
 	status = "okay";
 };

+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6eaf92dd0a90..e45f7218de04 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -33,6 +33,30 @@ soc {
 		dma-noncoherent;
 		ranges;

+		spifmc0: spi@7001000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x01000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7005000000 {
+			compatible = "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x05000000 0x0 0x4000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_AHB_SPIFMC>;
+			interrupt-parent = <&intc>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPIFMC1>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@7020000000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x70 0x20000000 0x0 0x10000>;
--
2.48.1
