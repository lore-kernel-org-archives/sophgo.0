Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BB2343B6
	for <sophgo@lists.linux.dev>; Wed, 10 Sep 2025 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470233; cv=none; b=UFTk3eE/fXvl4Gn0Q7+T2YKQxCgm23WLHT0uElRB7GoTXI3f01zitq1xWLTV6qD52mF4Un+I4Ra2vtQbPTmQWmep9cLCmGEmCxWnqlnU/IJhT4Qoe4eZ4hF7RDahJH7oTjsLzZEXom0S3G/BpE8qQ64m1xw37n2YjwZyn/TaLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470233; c=relaxed/simple;
	bh=+sDUkA3o71u4xm0yCZaBibtMSUQ/NK+r5JUrUR+q7Ew=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JrUR+SHSa/b1l6fsHUBcSyRan4yewZAdsg1nR7BekGHvpUxXkH+bb7fLLPJo73GkqiRV+OQAnZUHt2yeuR/8HC13LM0W9IqpVDDp37R1ZULKYNgfNaxFM7Tfv2FGSXOj5W2oG5LI6LTxCXssXY4IqVel/Eg4vF1ugGURuD1hJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhPGkJuN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhPGkJuN"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b548745253so88293981cf.0
        for <sophgo@lists.linux.dev>; Tue, 09 Sep 2025 19:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470230; x=1758075030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=JhPGkJuNc24M+NxWb9Ix2c+Ocq4R1G127sjisbL1HZoB1Gq9AxUoIy38c6bmgaQFUG
         Y6MX7Bkw9njkcGsHn5E8YiMIywyIv7SvC62aA1i1Yt4gNgxJYoy59jf0/jLv83QsyS4r
         dIK9ql0gdJ7712vQ7BLFsaBP3wzhdjwadpe+Y+Bc30HNB86lDxsNERQBy4XK7ptfH5zi
         tU+QqdqkPbKpCByEVq2I0ow++ky6MHgrfJ/ZcaBpLUemh1C2UHDrQCuPdlQLhwYYDkkX
         rlY1wwN5eizIYp24YSb2U155CLAjXk2R5E0kLEZOpAFsheXyYOOqaQqwv0cIcjAaCwMi
         Hpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470230; x=1758075030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=SvDg/5qgvd9otCnLudC2duwuQCgFCLjwhkVJnyuatX+dEPwYqotud7s1Eyj+Z/N9NW
         +k/QheIQAit9aJeQIGGGZCJ5HcuAFPHMj9215LdBayjaOg7Dw6Z0puMLjaJDwkhQLwkN
         lfVKUbCAdAJKvG9xg+F3nk7HX6jp1+786/b1gHm1tilqWnh4Jn2Iev0y/goGJM8XUkX4
         6wKYBLfP20gbmZGcalqxZEhmhQJBiAgrTOfVk0ufTTWYlGJxIbzViY2T0xv/2K4eidcW
         8yIE1ENsgZIjHqD7x8qwSEkhbYN4Nt0oRf6/3EviCPTd2HJZdFe3AIhU5y9naUNC6R7v
         pC2g==
X-Forwarded-Encrypted: i=1; AJvYcCU6hy3M4xXzcLA7SCkwaK2qgCs6tNWs0K3QDW0flrNRGBDQZTgXHYfevhZWAjlgca7exFfjyJc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfm0fhwKPjy8tDZioPhBSdVOEoH9/HkWsaqrqr+/P6FT3BKN3J
	QsietEuZTmWBVl0tZHvwQt6VX3fnneqnZpaabtsJm5OVM4QVcSZMlzl1
X-Gm-Gg: ASbGncuCq8AiZbaj46wjpS5r4SIee4rBEPDL6p8Xk+SNKboBm1XIwzOslph5DlVXAmK
	gxLGIT5vxDvzwnN/TS5ousi+bN+rktmko/MiqU8LeWi9Es3HwWPBz8C53iFDa7JxgnI4VhH1h8y
	/9anzmtlkWcghMxPRBx9sXWqyBzvZdYOA7PfXqohKmwMeT7555hXhKSzJ7pvqo5Bv4WxV7cADsA
	HLQCZSPn14LH8NqCMYir1kwg0I9rrZVfKdv2eVAabCgcuMbLP0DUJsVB8ejk31xx9d+5Ja7eKeR
	lXAAsNBN/HGv7EMtppkEBIzkRgUYSoutfRF5j9Y7va601CaoeBSHMRz8NSksZVquwBP3scdPfse
	i2CEKXKupoIK9ln3eKfMe38TNo3VfdD7S
X-Google-Smtp-Source: AGHT+IEQT6CbOd2QsWi0+OjHaJf57cY/Drb66adJD+cAQ0n8TdhI1gbx+/J0LeyepotKxmQzV1314g==
X-Received: by 2002:ac8:57d6:0:b0:4b4:2d3a:8902 with SMTP id d75a77b69052e-4b5f836707emr165034461cf.5.1757470229614;
        Tue, 09 Sep 2025 19:10:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed71ad8sm210106585a.50.2025.09.09.19.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:10:29 -0700 (PDT)
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
Subject: [PATCH v2 7/7] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Wed, 10 Sep 2025 10:10:20 +0800
Message-Id: <023eb6dbd2d9d808c3992e954ad7eb3840da8260.1757467895.git.unicorn_wang@outlook.com>
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

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
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

