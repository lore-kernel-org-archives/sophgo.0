Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224419E98C
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212014; cv=none; b=mDoU9ImUxVO2nrrhae4lVM0ox5lNSMykBEnmMRl6lSgYpx/Ya6kYnldz8r7QTs2zR9reB6it+49ECeJ1lIi+GqJTiD5+xrl4WWyg/okm8bTdm2MHnfGnlp9LybstTq4TvqVsmnPbiDU0kjnC0Q/z0KDcIat8Vmae7MmKZ7gHQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212014; c=relaxed/simple;
	bh=4zqU+l9rhTwWzFuu2Ui7WUDENfRl3EuHFlNyG72UCGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LERVi+wfuJ/wFCGYIZ9VsJcg002YzWGFZWRmwOUBbb6rFSn4+o4vrYk9gUFNYf2O9uDu6SF4Kp35Wo7BD/BHRVA1ldimHT26SgBs/Bh7CUQ97Li0bmfNSHubEnlBAf7Yy/w/r+J0vTd5mJheY2NLfz6ZEosofZvMUY9TqFNZJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edjbq++n; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edjbq++n"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3137c20213cso7554893a91.3
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212012; x=1750816812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=Edjbq++nCQ3RrIXNlIIMdREis3rRVi6skrkZ0Uz6NsRNUgF4zsECeFSKF2bzLZwQFt
         3zYRBRb5iIsUcY4GIm8QSB30bhVqkPL4g4JV+eKaaU1wwFtOcMLxIl0zSdonEgyzjIql
         yq1Y/LmZ4UPMcn0pXhmYduH6WQscZd/VxuRXy52plyAkC8IXV+HBQaFK7M+2dnqscf2m
         2CU/YXsO1nTGM850xr87J4z6gzlqo1pDHRG4A4y8BXlBH97cs627cTSl/cT8zKP7fzZ4
         qXHKAd0X0xfvRPShXiTwCQLjssh/hRVsFGPmwKdMDnB/b6l5lkZU+oQitiZH7S4UiRdC
         fUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212012; x=1750816812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=EOVgpTQz5fhR3GNl/V3mckiiulBfvjjqHJXFc1UrMgMcD/a722F4kOS0bBlefoi6Ve
         /bxqJyuwAIjAvyBtcjqu0wLGXDGI/RWRwvZd/nPmNcKPxQjd4czgpkVKPYy9YjrDFRWS
         Tx4OwG1Z2bBzEXX1F16/wBdYDbp2htSJko52+Elt37UWc1Wv1MkMXnfu0zdmzUeRq68e
         UI8eTiZ/1L3y21Zfm2uSBhn07GscZMEiyONxQhwD86JnBmzBD6eE9paJuGfFLWqV27gu
         36UuHEUv60B7a09ETrsue2nQbbT53n2l0sZ1EQJBXkHEKTq/w5zMxbnGV4TKDLOxwbjM
         59gA==
X-Forwarded-Encrypted: i=1; AJvYcCU8PtRl0KLvkMEA5xhoaHuGNf2LnyYLk8yC+IoN+6/qLbtx3aIGuQcpX0Hej8ZizlXz9Mgjt0I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn4rfbwQ53ssHJA6HUfejMGYRtNi7FmOkgl6YntQZfGU9bs7jc
	o8BRId+X5I7DsvJSxMTCKvUHaqzv+pglspIAySZtOSm6Z7FIDCFQsfkk
X-Gm-Gg: ASbGncsv7uNKb525UNI9b1F73gK/E2vc77vvD9Ye+0prS6q4tHtiKPCQdAfP5BEscIx
	IoSHaBmoSZTgo2UFzVyMTInm2iz4G4zCAUVHL9RQt7ZDhRXUllR2UqX+O41RE9H2xugCV0FqDbM
	oP8oTw5w//woIQZVPJ/kyD7okQ9L0w6TMnvfpHNgQpRo4OA/2wEj/AjYCj8x3B+enDQa7qIv+ei
	AQ6Y14Y1TWDrUeQYnziajkZOfENRwycVV+OzaIkRmQwTQFVwlcSU9WiJW7p3+ULvsq2aeFL/7je
	IlKcgQU6hK8LEPK+/BNlUET2KKUWFWhAzocSIbCNqCCas96cG1Lwp68h9mzJFA==
X-Google-Smtp-Source: AGHT+IHWCPRYDnFWn8oETguqq//0JZUxmrEFYPkvKs/tO5/FbBUcPDK5wCS+PyGgBZWbXbKIFSLoxA==
X-Received: by 2002:a17:90b:28cf:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-313f19d17c9mr29041866a91.0.1750212012223;
        Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bca4c7sm11437374a91.3.2025.06.17.19.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:11 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
Date: Wed, 18 Jun 2025 09:58:48 +0800
Message-ID: <20250618015851.272188-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSI device tree node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index b50c3a872d8b..c97bd62e5f06 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -63,6 +63,10 @@ mcu: syscon@17 {
 	};
 };
 
+&msi {
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index f88cabe75790..aae4539dea98 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,17 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		msi: msi-controller@6d50000000 {
+			compatible = "sophgo,sg2044-msi";
+			reg = <0x6d 0x50000000 0x0 0x800>,
+			      <0x0 0x7ee00000 0x0 0x40>;
+			reg-names = "clr", "doorbell";
+			#msi-cells = <0>;
+			msi-controller;
+			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			status = "disabled";
+		};
+
 		spifmc0: spi@7001000000 {
 			compatible = "sophgo,sg2044-spifmc-nor";
 			reg = <0x70 0x01000000 0x0 0x4000000>;
-- 
2.49.0

