Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507761E3DDB
	for <sophgo@lists.linux.dev>; Fri, 12 Sep 2025 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644646; cv=none; b=pz+prEk+glbwfbf5UjaOGu/x+LjYo0FrCgsQPl1jBK8R8+IqXr4D4LBtA3AZC7WIS0cXaRv5WV0rPtCNzEDLhWbTIGc2DUhuFTJOW3Uq51nH7Uaq9ZmoLVDzx/0cSxjMZd011PVZdL8l3tIo38LabIHV3bMCHVkeKFPckKj7chg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644646; c=relaxed/simple;
	bh=dgpNPFFxsdIAjczNzjU4PLG/4kOomJBC5GhTApKNwOw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0x3iW1GwnunZkYthRv4bSSRoEMUQccbRUmv2Rk1j+BLKukmbI4WCQBJbN0VnH7+zH1WPrZ+cco2wCL22tbeONkp8THQmDFxnQ95x5t3b8fXtAH5tdgllri45JziOFjf3KhjK3+dbogJttDvbF8CfdOD08A76Q3/INadNzY8qj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1ctgznS; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1ctgznS"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-32a9c1d2b95so837815fac.0
        for <sophgo@lists.linux.dev>; Thu, 11 Sep 2025 19:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644642; x=1758249442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=G1ctgznSvT3ZfrG+li5Lc4CoDiad+Z7nUrrbjOEm8wE/FjfoQ0jHfA/1RgoIu+Zkjq
         xmjgnaLE0mAchO6+2FhNndYWAZuwrrxC/6FUqVwPubXTf/bXtBtMqYN0okStRB+c12V1
         mQcYo3jvo3SMjruLcwl6XXgDPpL8o94iT1uN86f8Voxi9lV6LZnskKJvWXAFlAAeQ1Wf
         WYPnW5BoUp5np4xjPFZ35oNQ0vLAsulpfcROWXDCNnGdjbiPGGRYl7QvAAaov8E+41sn
         fUYrGUB69cS7XMlZV0qd7TPglTVcQyvGTmC4D9KwHxv/Y0aPxOQK2a6QuUsJ1XTBecK5
         XAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644642; x=1758249442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=tuAXvGeQr8GKjWkIxJ5K5NWfhaQBwsxnIeipw27HUjfq12XXiBOnKRadahBEuTckd7
         wx0FJVozh3XTtgEsvJ6SEd9Z0fbdfONlsX7OObTkv7gQL90Ke2w9S46VB+TX3lrW9xlq
         OOWvxcO49OGfgrFjE4IHr3jN8K2GecBlfGDiZIv7a4VrvBLT/VBupaax3HXzO73Epj2S
         CMebL2bnBI8OumLJuKrdgqbA9Lk2OuF9Jndld837u+uA6/46uoE/rHRQYuO/UjNvF+on
         K7jPBLzBGtud0Rj/5rPk2Li8XWrA4/hdk2doWvmzSdeiWPJElfZfS1w+feYpnL7Vb4Uo
         vR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjkn/0yjVE0T4YaJJfbhr+kHWl8rj6b9hpQKTRWj9aaEJCufvB9uS9lBVcBbky58lwRCkZHq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAhdlMkIAvY3O5ZDjVRH3bqzZj9FQX/torxbH2wHOJdsjIqdp+
	SdktB7VlCHJ/abc/ELZ3rH1YnVCp5LBXIob+IZg9Cew+P7SRu3WGqGj9
X-Gm-Gg: ASbGncsWjxgs/OGH33e7xwSJAQbYVkQthdnqHk9VYx9U/2cgz72QkaVI4KENfCf82UO
	zOTZ61lt44FJE4VsVpmkM7VAjRpH61EIErNDEaXcH22gm8AK29+ZjKt+qAY4Q9ziIc9fMFGwH6m
	qssFRW0/4WqZ0D94GAbYreD5U9dKBX9VWhGIUCKSJozEpiKBf7D1C6UqFjEhZP4FkoUtoRJW4du
	N2QPvJ499iNcP0hyytW254NNjk24P8uWOQ23EOhPPgFTQ/ahUmFTUikk17lEZIGeTFaRaTpVdgc
	dDUwdB157wbNCDHmROlf0xhgh8dmulvotNVuSWgdhM9QKtP0Gbina+qdvBJ9Z23b/M5LiXT36GV
	4JpVvmP8KGxl0i9nJXQT9QfsP+/PXb7t4Ee+7flxY5nE=
X-Google-Smtp-Source: AGHT+IFJlDg83j9kDJr9JJPfps+eRdqlRn3OyrAApBvHJZ97334vhQbAuQiDLCanW42L2b91pkrT9A==
X-Received: by 2002:a05:6808:6552:20b0:43b:6639:7307 with SMTP id 5614622812f47-43b8da12395mr687917b6e.23.1757644642421;
        Thu, 11 Sep 2025 19:37:22 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b828d2ee3sm565466b6e.5.2025.09.11.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:37:21 -0700 (PDT)
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
Subject: [PATCH v3 5/7] riscv: sophgo: dts: enable PCIe for PioneerBox
Date: Fri, 12 Sep 2025 10:37:13 +0800
Message-Id: <a499a1c17f317ea57de8769032ec65e1e18b4b36.1757643388.git.unicorn_wang@outlook.com>
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

