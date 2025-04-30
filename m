Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA5E19049B
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745979002; cv=none; b=FNKO6Au+5//Ea7tPYCSyAzAMwBBAqDFGIukG14LjWlPGgVO2jqX4A4HD3O1c68PY7paB2EOvDhQGrwmpiWsJGvFTv56IjG2TiRW5G8rb5QXHdoZXeMK0iWHxFA4DPGWWukrdfvKyHfgbnkV90SBK4RbReFvr7L9IUDwgqQI1qhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745979002; c=relaxed/simple;
	bh=1tyOG1q+z5x1OL3sDWuo8oLI4971HZGZMdBSgC2mPDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqScAihWuxkLZQHGowvNF2FDj/Gnk4tcklJBLsH06jTs9HMIfX1p1VZrt9w9jf1pbuWaecFuDUiVUfJGT28Mj0zVJVssJFuTiYK1tmVBrAbaL3YVp5Ac3lalV5pZnIps90A/gk8ub75JRtr3sAxX/iUcIkOr8N1MoLkHWkEgzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epogG8rf; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epogG8rf"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f4e3618437so33326626d6.1
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 19:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745979000; x=1746583800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=epogG8rfBPWpPnZ4+wK1J6s4zoHwKMEsdtSYaFdO/Tn4bMfrUhzOyGSHZn2skpRrOV
         h8/7Z7pFKHlHhA6hKj0Mj7xeiQ3g6tDn5KOb/prp+N5Mjwy6YluiD/6P6MTHVoJD3BL/
         dXkXT594ShNm2jcZqQyIfHg3YbwMH+2j7icVqgbWQoauzi3EVM1wv2yFaDtgOuH46M1E
         ex+OS5PjxsuDaXujwD6JAWAKzwenlGHMwsuXAZElvoFiDjmtKGtWdvJvRrUp1TX0V1QN
         80vFOJjNh/SEK1ScmW3cEpkqWjtbw0+jjYqUcjLoyWJHo41LH1bwLIL8XgBqMbp9snx0
         o0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745979000; x=1746583800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=HrumVR1/O/fw+do0Ru7ev74a2mfHYpQQX+UGNefMtDg3p/7h6nY2bhCDUN3mJHcst5
         BJi0jJL8NhuaSAJJs+i5x7hU3ARmeDbIRz0C6poQa5GwDmtBKbNOqDqitALK1eU7/yNF
         ITrtGh8jf+soMffXXhZxiwU3b9kTVVX/Q50ILPo9Ze45GpfhUi+ewOrW3QNp99V44OuD
         PsEgvKHioF+gJhEaUUZAQJhW6w/bCNd+JmYK9ABtDQBVzpOH5EXwmtqesmehlOoee+62
         4xW7H4vef/dBsl8S25Wh98RYT3huir9TAPohX20odb1x0HgU2v4/fzkgibO+etx82Bxd
         0G7A==
X-Forwarded-Encrypted: i=1; AJvYcCWcKGwgIfxLmR8x6LyVeYhR/oQ+DBXCtVWA2X7ddzi6L82L+dPTDzJXAnMIVSrDLtY3oUBPpps=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyCvOkKkJM0A5vW7KMe+OC80NsyD4QjzTDeiXhgIlkf4WuZtz+
	UL9QbAMHxQLj4Lpt8TOR/c8OYgrAivsihw9bGeRyganH2JCq1OCB
X-Gm-Gg: ASbGncu3zeD80+Glb5oxPoQYMFjhL1R86DjiMxCE6FvWbz4pqLLAm4IfDR5sb62/YGi
	0UcJQy+s9qYKsNmnJLyOp77unVqUu+PRCMh+jAHIYqgBRUqwVLEeW0HWQERR3tplMgO3kesIUsQ
	U223eV6530Y4CXUBqU5Y5VRVOccW7FApuUil1a3oE+5L0JRVhfOoc08zTHwEh3YCktXxWm6Yiqr
	r4IwRb8dATZvV0/vCuQIPgUXvkn+dNAvslgbKFgA1oJuBlEXWTtrLRtPHoXBbeGB//WEomAfNSO
	OwFgaoLubiAjyIbjOAofFnHarQo=
X-Google-Smtp-Source: AGHT+IEw+u1VOIT3kMd+/VKXR6Vg7KtGCCSMCagVWCz8MZpIQ61san10JzgRKCphUO6By5kz9Ks2qQ==
X-Received: by 2002:a05:6214:2486:b0:6ed:1da2:afb9 with SMTP id 6a1803df08f44-6f4fcebf45bmr28113456d6.19.1745979000035;
        Tue, 29 Apr 2025 19:10:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe70a277sm2901756d6.55.2025.04.29.19.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Wed, 30 Apr 2025 10:09:31 +0800
Message-ID: <20250430020932.307198-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace newly added precise compatible with old one for existed
clock device of CV18XX series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 88707cc13fb4..90de978f69c1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -29,7 +29,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1800-clk";
+			compatible = "sophgo,cv1800b-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 0974955e4e05..9a2a314d3347 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1810-clk";
+			compatible = "sophgo,cv1812h-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f09c9199102..b9e4b4687046 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0

