Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB528E17
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 00:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503247; cv=none; b=VqHP6Q3gAObVPxTsP5HcKR/1IoToJW22rYdIpt+DYFuIyJqaoSjhL3+EtpR0WQqJFR2nINcJFxxu6Rhh6CA906J/jMC9vRdsVTopnrFSqVLwUaFSIxvkDNp56AL9NkLqTpaq1ryqeaEdGPkgFcAFaXc2qwtMR7IICptg/eePEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503247; c=relaxed/simple;
	bh=lvfjboLM65D57OmlVcd5+/8TTINLieQbyt3q+HrFWX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a87mDlj7Y/RLZTi60HHL5smNrb/WYviqvhmZIWFpuTX7ofx/SGHly612W+KIz8XCJ7ma2VhK82uquwnfBapxarpBQ5E0gzg9TTnn60ilUEoVlJtFdD/K3jW8u5NRWqBCr3p3PYUWblmenC2rgT037+OxaGXTlGZ/8pQgFM3XiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ye3bUqOQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ye3bUqOQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74264d1832eso6035659b3a.0
        for <sophgo@lists.linux.dev>; Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503245; x=1752108045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=Ye3bUqOQOUtnsikOxb37McAfCUpmtaIm+phsBDB1lpIOzUuycvywF+mutT6+GN8z6T
         qBUBby2xY/1R0MGukAeiUFUcIw0rlAMViswJtcX3cclZ1tUHOkW4DBn6aSaqaQwpZqLl
         FCKHAHUMiL8QlB4Y/Yca76b2H5IGnN5Eryhic0+rAAOsLfk4ul+N3oaIQe/iPenKOhhI
         0xJ9pP+ovsZtf8FiKWkLm8w9pyxqrgtByvy6e0b10xwH+BJfjm4lGhIUEcsSgW3I8mMP
         QYDNutQ/cBAyXjbpuLKJz5nRfuqQmR4cTGvWdnmz5CsuTtbBbBw/GrRum1R4PquS5HXa
         /x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503245; x=1752108045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=UT89Ykq9SU8b61HhgsF3VOPxS+zbmE4orvLAyqnjb0Rpi1h0Dv6pPzau4sB49yv/Ur
         hJ8lKHJXDy+z5YgSibfWIt3DjuJUU3g7H1TXxgVuaVgx7oHJ4s85jqXb19I9zsGktJt0
         Ty7VhNEGkz4/L9T7IJWcHTBOibFIRXeE//tW1XUhsO9r8BjiciKWYM3DJ0eq0B+VyvUG
         rkdNGCbW2bTWs89Ol5H7bDiWpZSwu//97Ua/jv9hWhlQtWtyzxAz4SD/KOfXivPunj4/
         It/gFifDQ8pLeXvjcc3toGmV4XUzITenhpOtOJ9jWNxZdb6ROZ2cZeOxj9jhxchJvnIO
         dhqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCSjkuB4yGv7s0QTslCHrb55ZHqsO3khgS7g9hu/ijITocI4YbvLCVtm42t+eDvn17Zxv9zmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPtLvTWHiCDyRVjJRmVH43waK4Vb2YELjIeuQjtevO8ML1Fls6
	pm8Y6l6w89VEAA7EzL2cjVsBrZY1qsnzoLkOICtWPOq8+BTamDNR9Lz/
X-Gm-Gg: ASbGncvwiA+7H0QFR9ctAL0XqNlqhuW2DsZJIbk6jGDhvgynPD10zCXwkcRT4NrHRzq
	eWb44pftH6t6+vNeMIiJj+B9KtGY7D2l7XgSczYh25Jo/qiw9E6A+0LJncjjdyO5bU+pJYYshdA
	Id4FjA4WYkr5uLOaFyFzMNc935Zi6RD2gvJ2WPAH735VuLSqmGn58IG3ndPkk+g4CONDm9UGW+i
	3j5OFUnKUgvOM2qf2BIYBO2nz25QaxPh6EO3bbMTAL/W3g+bzrxktEE7zLKlsGUsY6N5dCGUiIX
	xfZnaE1P/F4fCGAxLFkvDEBfkGIu8YdCza3/8f0jQYWw3Z4/Lc+my1A8XBPoUMBzpHqcv01w
X-Google-Smtp-Source: AGHT+IFEgHWRSZOM1OGOkaV/VMwcCoCEpYqFzUShN8zioQuMCjdKGgVKSOQXH56aFJAs4t/pv3Uo0g==
X-Received: by 2002:a05:6a00:2349:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74b5149d55dmr5410675b3a.11.1751503245093;
        Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e31bea22sm13872345a12.38.2025.07.02.17.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:40:44 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
Date: Thu,  3 Jul 2025 08:40:23 +0800
Message-ID: <20250703004024.85221-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the uart0 is already occupied by the firmware, reserve it
to avoid this port is used by mistake.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 96ccb6120114..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -113,6 +113,11 @@ &sd {
 	status = "okay";
 };
 
+&uart0 {
+	/* for firmware */
+	status = "reserved";
+};
+
 &uart1 {
 	status = "okay";
 };
-- 
2.50.0

