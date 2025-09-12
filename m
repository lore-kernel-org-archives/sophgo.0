Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9321D54E3
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644668; cv=none; b=gQIqDZ2agHoTEqWsd8Cq/tZtRbdNPaYgogx1ToIj1qTGk9B6KokZXYE9jcI5xmUEdIvY0ANv3qxwgFOnE+zrICxzZ0ZOzdwStA9uV0KMbO1J0YzFJpCqUQJXJOHmToOfS6trDfBwOZuFUEneolz7fBeDV5liXQfa8uucYtrKoek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644668; c=relaxed/simple;
	bh=7ZMKBRn7WTwBL6qsn+lHI9SZa+lKRdoNg2FdbjpyDqE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ioVHXj/yzNrfP8mU07oWTm+Jum1VXBjptkiYili7KCrppEiSyGI33D2j/wKIk6PEcpAvXJXL7OvyzI803ksZHdRk/8PLRinv1iWCJMjiT2AGDrOl04GTbQQUozFuLuPTccevlYhxrKeJvpQYCEJee/t5ImpH8c6SRxwop43IKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igqkC/Nv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igqkC/Nv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-746c0ee5d77so1099246a34.3
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644666; x=1758249466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=igqkC/NvJniu3PmkJc37n/1z1YgCQjSiN9YzTQg+EtdEXz1OkBvpITf8Fwe7/IWplZ
         BW5O3/q4eT5Z4NSNrhRyO9S9zSSgLGMNshlKGFg8gLSdeAoSEBqn6LKRklOAc1SgwcQS
         qutj6iRNBR/uFETq4Ju1Ue1i4SoLsvUsFyPeeQNfpcOQNpoJp2azEER3fbY351c9PVfz
         7jwK8ZTGYMWtcCo5flUpnifjDgQQKj6ERNuBb0kHdzsmtoSgnIA6CcXVT+MjbjVjM6t4
         hRYOY3RrQH2OAf6+4p7rsiQJ3wwaoKIqt6uKFgLRpfB9/a5F7aN6D/A/W8twq44xnimm
         W6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644666; x=1758249466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0NX4YDlfnF2moHa0Gi9m7awPoXSV0rkM143rN50kIc=;
        b=SkN1JyF42+Bc9LK0Gm4x9mqmxEUpojHe2qQdLIXyJhA0eCJRpayLQaAPFCMiIIc+pd
         q5iX2wGVoHyvk6KPJI9uav+ZXYf7D+KSaMOYYfJBG9tpy8HRGwle4Ki6aVwWNHueIwpo
         KJ74huCrrkVSnvNNlYpNNs+1zmpOE9fQEGrVDrrrBpaOI27+IR+NQZ3bf2c/EobojOiU
         GNp7r8tlYiVHGnrDA/g6XWa6oanpUIq0jdu9gN/JLvYKoMsNgdgLuTkEBUkH7VAzYT9B
         T4lhZNqfoENMlOT1kkB5OD+1BCfCEdO3VZ6MnZzzPG35Mb7SU5QHA80jchxoUUWhH3fG
         l8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBPXbT/PRCYAknjLwcGTXNrkPXuJQ3fcING1mE8Ih6ZpbRL5mMwTjkCRJIABzXfpbe4VkMtMc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWjkw9tIvJW8hrg5j5vBFIFksXlImaSPtjTDEPL13oY4zx6g6I
	x0me5OB/Kgsky1GI/0QdwTdKI8BDFd0xo0NuYaSszVUJu2z4WwdvoMLE
X-Gm-Gg: ASbGncuJYZJQcxDvyzPyZaV7KBtN6rlV0jPoY6zhnbOsEcIboGQ37ynvgEZkbA6rnNC
	WKDLiGVTeCMMrV7m1kuHN78k6DcakY6rAqAn30dBV+DDZtP1ouLx+AtSjhqD75iNJpTPK1KQ3Wn
	XHwz4lc9ygercAPvQeMyMXyJUvBCFQWoyJ+f7U3vzfE/0Pw6aq4RJnB0p9Tc1wontwxFEKgW9cD
	1CnqDlaWEoLZPWWxbZJJCo8+uGuJuEaFLijV+wqtqD0idL7+PRtkyOEHdmNbLr/2FHqG3XPNqBh
	ORZDOwCmR6PuDIRxLCP4vwku+CN6q499UACVDgA/eVINPVRw16PIl1pjXxi+TewfK9kjEnQ385Y
	iooI48+TzMEC7nsN6S9bgcDOF6MsAqdVJ6ZIvZn+HacM=
X-Google-Smtp-Source: AGHT+IG0TQa2WVbWUOjIbbfIZ5nePfOY9XArUERpTrkKtked//q7vNW0k55MNp1jMcZH67KflOuh+Q==
X-Received: by 2002:a05:6808:4f24:b0:439:b198:23ab with SMTP id 5614622812f47-43b8d8cff2cmr506892b6e.18.1757644666012;
        Thu, 11 Sep 2025 19:37:46 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a7264asm586173b6e.21.2025.09.11.19.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:37:44 -0700 (PDT)
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
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 6/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
Date: Fri, 12 Sep 2025 10:37:35 +0800
Message-Id: <76d4012e515dc3c3d4e406a237eadc55203f77b6.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757643388.git.unicorn_wang@outlook.com>
References: <cover.1757643388.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for Sophgo SG2042_EVB_V1.X board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 3320bc1dd2c6..a186d036cf36 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -164,6 +164,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1

