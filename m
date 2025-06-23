Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA9716F841
	for <sophgo@lists.linux.dev>; Mon, 23 Jun 2025 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638673; cv=none; b=NNxmm6mGnO8+PE+6CW5Sn+SzK67PhDrfM2zMyqWI4/9rmIRcbuNDOVUWIFs+2lptRPGJZlbti4Rpq5IzSY+gwD467/pArvEkQ2BXMtbw1PWLmWIh9Tzsvjl/u1bxsxWnivvFXzhwjQBjY6AG49zpuy3dlGpJdm84zjewK0gTIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638673; c=relaxed/simple;
	bh=5ZNqzbA26kOPxapIA2PSAAMFwzrTK2BShlFnMI2cNR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ch4mgW0nf+Z3hZrZVNJtkP8ETPDs+2G0D/zyRE7ZH6V+EqyX0vCe7d/IWjE7eIDqERENS57pH9TMAfYSd+H6jshfY6DxDl7vYi6ezUdSr8vOuaAvIx4ocSYqDCtdThC5jkibbp9RLkjZBwXZqrf0o3m85/VzhbOlnQxxSig+cSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNAq1RoQ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNAq1RoQ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1761767b3a.2
        for <sophgo@lists.linux.dev>; Sun, 22 Jun 2025 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750638671; x=1751243471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q1kf9zD36m1QpyUUwIQ0WQq+s6bZAcLbbdo0D4u+Fw=;
        b=BNAq1RoQxeOLt11O2XPg9whlzaySC5/Be3b+nmYHuEOggAo3PLn1wGgT2ImvTHWWvf
         PfAjHyQMZhPcHaVDDUgfsuSvbNGTD7e8l0tRewUvUgUUqv0IGTfmYUhFE3u6fKSezg/q
         AqlWEke1RT4JPhCv/tmiRXUBVOaVeAUESeZTJvNeQiKq3rjV4DPLaTgPDNaUiqjALlve
         +nSh72Tf1sNIjP3BylqNAeQ6CrZuSl4c1NIDhttG0UL9z6Vq8UL2f6di/y3TprvccJhe
         kqsdEXqoHyBbvB0mFldQDoWf6US6yXOgCMKCn3y794nFxceYHv1VP+j60aVGr1UeU902
         JyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750638671; x=1751243471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q1kf9zD36m1QpyUUwIQ0WQq+s6bZAcLbbdo0D4u+Fw=;
        b=T9duq4OdGcqF9YiDCQI9Vq31eR4xXg4WEEbgvVDfisc7PS+punzyz3XtgZ2yTJdz7z
         4T4Xrh/xHJon5eSnKAOQNdIOywuNSuepb6y0r6os2lxw/5YkSOmoYXrRb+xSjBHYPc7E
         4P6m+b5owpBdsAfxWzQ0rUIA08j/WN1w8GitYor29OBCUHAyhha7rSMIgFjGZ4dTbs8K
         3WLnHmR34HWrA8rTgPjuWGsZ294vIzNj/s4bS2C4Ax41I5GALacP1apdP2WANaKbMdev
         5S1xcb0fRBAJ8eNDR8RA66RAgQFjtW0nDbO7ZLZUuenKePhv/94U/M4udjTsBsKYxfBo
         apwg==
X-Forwarded-Encrypted: i=1; AJvYcCWCHc+T7T7dlhetg5cRbU12bnK1cV/tPqTgeykK+L+Pr56NfCdib26PfpGgahgx9TsZC69RGPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUG8V314ncRLGRD5YlxkumKs2nfbJI2BtdpNXlL10qNfNwqPML
	u1Sji0nqgMszEglkSLQZWLMTY/0nYhNgFm4wa5/zZ38aN7cIXE2nFim9
X-Gm-Gg: ASbGncvrJzHfKXCy8PnR/cnxyG0gXd7BH2mx5TD8kYTYXeDNOvw4LqDFEKudtU7hLNc
	Rkos1vIEgGubztDfBCFf3vtiID7x1RmmqC+MCeOmJgZmTex8pWX/DFQqQv8S1LT8NTRWMYXCkhL
	7/WfoBXge5drE7Uucuqf6TGdYmGe7yUL0b1W2SikVBmsirsnlOjhhkrU1u5XfK11pXxrdMfC0CM
	IncD5PQOlGw89ZfZsE0VZ07qpk4tVvuw8zlzkoWfaBVUgrhKT93Ch/hrobCb7HXUPCcbK3VcgZF
	bFeophTdPxXoUtjj4Nib545TPPIZtgEiWathPENRmWpZAP74Pf+C0N3l+dKUNg==
X-Google-Smtp-Source: AGHT+IE7SWkZKqmzCTcflynbcCf+Hta3Lb9CcCnLa9th5SlsVN06IHYW3V9tm1bawfDuAzKPJuJUoQ==
X-Received: by 2002:a05:6a20:258a:b0:21a:bfb6:1c74 with SMTP id adf61e73a8af0-22026fa6a92mr17872987637.34.1750638670941;
        Sun, 22 Jun 2025 17:31:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a66a763sm7193835b3a.141.2025.06.22.17.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 17:31:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v2 4/4] riscv: dts: sophgo: Add ethernet configuration for Huashan Pi
Date: Mon, 23 Jun 2025 08:30:46 +0800
Message-ID: <20250623003049.574821-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623003049.574821-1-inochiama@gmail.com>
References: <20250623003049.574821-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add configuration for ethernet controller on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..86f76159c304 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,16 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "internal";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0

