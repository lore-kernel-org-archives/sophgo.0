Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B81F463C
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470189; cv=none; b=LNRhHUBXaskP0jiINXgNcvQBEv2cfRr1FmJhJ8UKzVX8CoNbmAn75nk7b77N7I9d9anfOy85+jSbJnol6j6FVkAipgKJ4ZhPH4XnJzH4txG3Nfd+LtdCaTPGjRIbjvfyN/U184lV9lpRIIivUW+c/iC5HI4usIudt74TZ2ir+2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470189; c=relaxed/simple;
	bh=dgpNPFFxsdIAjczNzjU4PLG/4kOomJBC5GhTApKNwOw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OZ0klcWgDGV6RG95oiUAQjx2SI5Py2DfqMsyrxTXEy/JG3UiX+GYMVL+D96BgAFe/tmJqQB7UWr0cDqBw1dMP6ezB9oYSc+lk2oFzV9FPvQJR6U4O8SSyhGamP8rRoCTEV5qrRnc+4iVk111gV91AlUw7rtiBaGIfG2gfzDZWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLRS+vcu; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLRS+vcu"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-726ee1a6af3so69973836d6.1
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470187; x=1758074987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=dLRS+vcu0rCEBmh4LU4ZDouX06Y7EDckNtqMERW0xF8BubEnSikEB3m0PFicghbm9X
         w+gLaXdfdyNAVIuyCteeCsurLLZgVHexEnUQHy9PMxFGtVi+JBJbB+TL69y0C+5y8bac
         WQ++S3MHS+4/0p4lweRGjkALieY27ujGPuStIdpdpZrBSlqyDXv0zOwtNRmMc43WbAph
         PHOiH5iHqiUwDzx4yBkoljvmhC1VVt62mE8Q+LhIkp0BWO3U6h8m1om3x9OS+VpI11cG
         c93zW8Vd9WPZxLis5DoAFIOko7uFiZ3tw3rU5/tF5mPI+PRskNI11Dm5w0FvhjEV+VJ8
         giHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470187; x=1758074987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=DrSaEPjvJQKRxmKz5PyOuLZHCiEqwfvrgHr0rPpOhVDLsurACKGx/dFybWlo8PRQBB
         TWOFcoDocZNG/WxwnSoRkLfRho+5tMEY86gsbszKhNU4jGi+Tc/rrXdXF7JMcY7nsG8x
         fyv8QqIEFSHleG8HA2paY01rXzPPL2/RY2yJ1dy0Vpo4YAbWE/TR396+gL0NSoWl08eG
         AhI5lSWGbInXpR8nN9NcqOEnoNP7H1elHDnf65KHiXCh4NVAzgRpUz8v/KEaGImjtSNG
         JZeE+IJNWVLK0d7aVSkMiV2MxQ+qDSVVsZoBQLHO44df5nye8O2D/JjyHDbOYeaaXlRx
         1G+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQfsUiIToFYaTKa1zPf7UPJWX/s0+8KKMK7pI84sB9Pp+w5BkGUx5oh+XmopHS37VCfAX01qA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA/hj1BzQLqlc2o3GrzkRNHjdXuWxJ3G9fxNSC/dEjVadG1DR2
	xxkAX9BV3nDzHSDCDDpCvzTs8Z6Uvk03psWeroXdyTMFzBMfG3mevlyj
X-Gm-Gg: ASbGncssIaqgxOb2pcBYF5OvTe0HWH/JEvqAEzBEgUJ/pgbHJnD0lvrZ6rYOCNpu3KT
	E6EHHgUsWSbgJITzcDWXeczUDrWz6uVS0seZnnJQ02MW96ZxrRVHd+GEztwdHjPSOuTFTpB8B8b
	b2PfhG2RVU7tUUaj19uBZo5Ae7nY54GlkgQNHaipyAmZGcQV1FjqOhoYR9iX/trCwBMyOr0h9z9
	1Xi+4Iax1Bt1+7IyETKUu9riFTYT581ms3H2opugNmeeyqOiKSTKwt/9wS72YOAsGJPjG2AwPR/
	MPh2q5Xh93VuVVRG6wYo/GQD9aFsN9wW/u7IIisXWMeQYtyUsMXqTQ+hp2FW5w65NrIPoubU/yd
	FHM98C8jDy0cCfVYnni73iOYzdfss7bDl
X-Google-Smtp-Source: AGHT+IE5QuSz5qdsE3xoQsl6qbxguCNJz3fvFYDs9yiT61/n8SvvUWZyK/OkyKtb2ZUzmAhsv1j6mA==
X-Received: by 2002:a05:6214:130f:b0:711:b9f3:1fc2 with SMTP id 6a1803df08f44-739253e0b8bmr118544936d6.26.1757470187091;
        Tue, 09 Sep 2025 19:09:47 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727d637082fsm117730896d6.34.2025.09.09.19.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:09:46 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 5/7] riscv: sophgo: dts: enable PCIe for PioneerBox
Date: Wed, 10 Sep 2025 10:09:38 +0800
Message-Id: <4e885f30470ea07f499c9a83ab5dd327e00774ca.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..c4d5f8d7d4ad 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
+&pcie_rc3 {
+	status = "okay";
+};
+
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1

