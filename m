Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B5267AFB
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425420; cv=none; b=twr49Y4eYymLT2zM8kfNebRt8cYM46TsVSlfsSg+5PrOQLqTgAs20Pdqnuch2XsSNZUff7fJ92Ip9/3cgWBnyvskURelUa+coYh9sj2JIanqQiz0JIUJwF0UKjfX1T8qNURD6uFclgQkrJ6Js660UFvhIWDHnMAuaCVcv77uqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425420; c=relaxed/simple;
	bh=MEg4g1tI2gzPjiDAg/RMFo42I/O8x0ABz40/UB7t7qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSfhEhYueGUz0RnrFPlhmF9f76n5sHe0x94J352K7tEfRiRsVJ5d9iC47wTXFgK7obb/xuz3culjaWe7FVKswdHr/gU5LycxkhanCQM/UGmm1O2vR1szxyVqw9Ll1jLoR4+kqAvTmc3zBYkLNv73pMtUmzIBGwEIXe5K6oEZXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTMA0dV3; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTMA0dV3"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a5903bceffso48358001cf.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425417; x=1750030217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGqZ6H9vgVgHpW8k4kYrkONK2GRCAnNYk099WHkJuBU=;
        b=HTMA0dV3WQnqYCPQYve9/0+grgETa6iY1ps7Wk9Hu1oDREY25KH3cpsxEkQ+ExCWg9
         A/Xwlh1nTZWLTP6aS09GImXGpqC7EwBWfbEdD97kkYqoAmV3yh5NU4dvX1hwNimYk0yw
         H8gp37epJjdh7zrdXyIuSGTVUmMFK8xAHoKKlaiuLURd97VXyQb5qfGw28qyLV2v8+z9
         WszOjfspQKkKcZJ/WLz8cqxRlolS+a77/wcUybNhzjgm5H3SFHhBYRgUa+3ITFoJQWlk
         00r/go39SVZQ7Gctj4gwP6qJp1Muh1+1UDii8d9ptRiX0kQjHtO49bG2enccj6szr0mF
         vQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425417; x=1750030217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGqZ6H9vgVgHpW8k4kYrkONK2GRCAnNYk099WHkJuBU=;
        b=r0MjNxABPasdvqryUe+d23gRpfV13ZZDV6nAbRVGP4+RwUEszF82Ao84VHlCDXvadN
         TqDrWX5L+3KQdZreGDTgOv00h4utF0YyJ0yhrz5YwDXNfwPzoM6OkmMT3R73PIubazda
         NiS17+sBWpXp1xib59Df5t3nSjS9eDz2giC94QOa/48DgWgV4TKqI1cBDHAeKwMKxbas
         jx+hbqYDJF4mTStDwBDO1Ou9tdq76hJYSZJx+r94mufEfhQrBgZfRZeCINB3OA9nDXFN
         CELP6X0fLcoHYqpHnmixuvELuLsiBbMTE6fR9lgeBbrxemuBuJHzZEEmws/iajA2SU+o
         y99g==
X-Forwarded-Encrypted: i=1; AJvYcCUUXkyZ62gJX3FFe8depMGUAUvO92UXYGVd2ccHGv3E7YivfMTLfffVr0ecl9DoGA/kUumCzJM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0QcarJxe0C/2CmZKhkx6SV53NrOYHNU2M+J82Ku0eqX3J8wd1
	nVuCt6+unW4iInyEzRAQHwiuJVLnEPvJAdl43AQdvIsorLsDAcY3huT0
X-Gm-Gg: ASbGnctfI9hLRfRJNeTunyqYMN4LSMToDvIzXHziq4DqEj/JFcdvYs5Vp6WLGkP9/NR
	ZLz45Qf190JoYmEIwfyHl6pJsihwAUx89g7vytzzeMvB+JZDJpjzmo+z/l9Ikg8StmT4AUznyPF
	KzK878NGX2NjZLQPg9FdLigQymFGWJ4YscHktSj6V447b+9jGdDwwV110BsM+VuOEsIgWgt3BFy
	B0PnsoYpuENRh/XCeo/bNxOExOaSmwUxJYwj0dT/HETLQ3rR357ydyDM+wR/vCc1KiPrcGa6DmE
	p3KFc7IRVKA+3WavAzh7vfbnrbN09YIB5UqFQFPocWlAd7qK
X-Google-Smtp-Source: AGHT+IFxasvm0DM58Er+rulpc8xCIg1aEcLZoSpXNO7+uLu6yJcvr0q0o85JQaJvO6S8Up+1XYUevQ==
X-Received: by 2002:a05:622a:999:b0:4a4:30cf:c213 with SMTP id d75a77b69052e-4a5b9dd44eemr176529811cf.48.1749425416628;
        Sun, 08 Jun 2025 16:30:16 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a611150479sm48333501cf.5.2025.06.08.16.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 10/11] riscv: dts: sophgo: add SG2044 SPI NOR controller driver
Date: Mon,  9 Jun 2025 07:28:34 +0800
Message-ID: <20250608232836.784737-11-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Longbin Li <looong.bin@gmail.com>

Add SPI NOR device node for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index be20efd8e2ac..b65e491deb8f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,30 @@ soc {
 		#size-cells = <2>;
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
2.49.0

