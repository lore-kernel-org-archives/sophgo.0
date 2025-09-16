Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D5331A54C
	for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028992; cv=none; b=XzJWcAPPOBGboYeV3b9APzPeRWA8NwNBVtdVebgEkEm0smm4jFIkdmjue02XnQq39YO+jpWQFzXnSGJhQntIQ3wjDDO9KTL4QRr/GTumJyWVhFoU7iXYtnEwaZ7f861NJY5cOhbOLJshdDw8SZg1/Hd0Wtu7xWpE0h+n3XUrQzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028992; c=relaxed/simple;
	bh=3DhmzJSYRDsFCvFry1NGwCNmIuQHA8Daa9KPGiMP4XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za1QlwxJ3lFakGW73ZbN2xz6d/JSJdU5Z40+fAXzv1O7FTtWyJK+/zI1by/MGiRXw731+2Vnyz7ksSRqt8ju0rXW66PfnM8El//CJDwRCdflIInIBlW6vkH3eRaLkeoCBc+NF6M9va9UhqqVrprQE+0cZa/nno9fEr5Vui+55d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlF6SPIO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlF6SPIO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4337733b3a.0
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028990; x=1758633790; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWMqq9LO02bLf8s/U6m0bmjKdBTSQTZetwyPUYJWXY4=;
        b=DlF6SPIOAFePzolcUDpbpZWsPmcN7zhBMczu1ndegwLr7Lfd/d1vz32T9f7KHq8squ
         6dq+wO0ha3Y7v0cNtD4wDJSSDCcnNuGXbU8PtIgJpM8ycUMuGNsuNYnJ2vRoGJ48+g35
         Y4Mrwy3kYsYtqK3XDfq/DsFt8853JtPzJAmCwnbozl9tS2wWWt4V9qRslMMdLOb5pKuI
         8fh+2ENhofnatWxz7I/YV5IXnWsoOQDRafm2uyXfgo9QPt5AuJKp3Feq/4tdiDMJeULI
         oE1HscvWq2hcN8TiHw+metJWZBd3GmSaegSoJJWRu+eXF8nt1JTq7QAtlOTz+qAfXq29
         7Enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028990; x=1758633790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWMqq9LO02bLf8s/U6m0bmjKdBTSQTZetwyPUYJWXY4=;
        b=dywUlL+BmatwPsf1g23iBUBwZg4OTpjHUI0WQHqCsNIJz8vGiMoMcMC+4trcCoARQx
         /rZvYEXCEpTm1RidSrufnXT5pWCqjbmjFTMRHJ7E5OVfZSbEcQb92lLOTbe701IKlEgR
         fQ7WWEUEwxGgWyrYQ0Uyu+659d4rh7Y2SYnMcHg/4k3utPKwrcbe9XXSZhHihvnDmSRL
         M6M+N/6MyBUFOZL4euJ4AUvr5i0QDs6f/DbpY15O+NV1yPNkuOth1Mfm8/QMTvXIewRk
         42eykmTQ72uaPsLBCpwzzjJiMtf9NcaFCLTKxJaFn/Ex1waEZzEG7ffC50bnzhOkJqUY
         cZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWanyyGXknpH+HjzRgC5HGz4gHfBF9KdDI5CGU68l6JVvLZjhgqFOyERpfw7Chy3USJzx8W2jQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcwBpoTRZgFDweXsH+0FF7RlHKvIlKQNK1EujD+uUhITJJ0Rym
	3Am7LdpkR6GBj08nV0nZgdJ2d9XnKwYGqbDTlQTYhbYkIZwP4XVcz6ON
X-Gm-Gg: ASbGnctzBQjOLz2TTic/kOd9ZF0dryiwk1b673z9B1UiqOLf86lUN98SvyOukPgn1TC
	UjaTcw4Wh8lAJZ/rIbtyWEXNtrC8bbcRZ3OfrT0Ff/GlzDggCo7BT9niGmsdwxBSXRn0Layj0Tr
	OSyDYEX3zAi9PhEE4aTGGYurBrhKGrER6lCb2wJUieHwopcP9FUxQ909Ky3EChdLeNZM5VcBhkC
	3qYjPEGFIcf6KbYytoedo084NcswFV4dpW+cLVD63r35ySPQlFxF8nyd0lxv/7VhBwEkExPAIGn
	ipIGVtYS/nz893BaoAh5adIWsndrsF8IHANzl2xoCQxTCKKagn9BN3r9MAyMyumHdjYSTuxtp/i
	e8glWcQzdV2HXXbXaoUYnkeAZJfSxdw==
X-Google-Smtp-Source: AGHT+IFXpFj62OZ32vgpqEl0jm4rS+hTk4dVTJ7qY1Ii9cd3iLkjwoIHMHjRDgvG6v07+neosQb++A==
X-Received: by 2002:a05:6a00:a8a:b0:771:ec42:1c1e with SMTP id d2e1a72fcca58-77612168e3emr16052303b3a.16.1758028989635;
        Tue, 16 Sep 2025 06:23:09 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:09 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:52 +0800
Subject: [PATCH v2 3/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V1
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-sfg-spidts-v2-3-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1276;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=3DhmzJSYRDsFCvFry1NGwCNmIuQHA8Daa9KPGiMP4XY=;
 b=OLm66401v2Yc411lYVRBOoQ+/JCntUIWLk1Znyf/hX9gSFKbuT59M3tCILRkKSEjEaaHjGW2C
 dJTZ/jmXKq1Dwveckan4KcjmhHWTbAuLhHVnTO5XbTGuox/oBOZGp0P
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for SG2042_EVB_V1 device tree

According to SG2042_EVB_V1 schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c66ab1a77fce719f145070ad51f297..517943696eb464d54d42018825f02a48c6ca00b8 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -238,6 +238,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0

