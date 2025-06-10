Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929D267721;
	Tue, 10 Jun 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586371; cv=none; b=EbN27PWJBfeOD0X+S6ueUhdzbkq1Ds5RN8rb5dw0hwAPPDzMMhk4UdmTBVtQOpSzoJdrrx6ov9WXfaND1Rs+1aKlGMvI9eSY/A0QcAOGMULOp+CWd4jV1qMm1KqMdd+bWqAk2+xAlU80oAMWDJpQy0XFSe16nDa7K9+2izJOPtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586371; c=relaxed/simple;
	bh=z8TUXJr5QsqnYYZqY2zibHKBXHeJjmjKYYu3RcdvDME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYO5mC7XqMpCnMcvGYELtBjrrCCMv7MOEouZnjNfUd1UGnethv0JDmaLcbX0YoW5zF3mP6BD6ofh3hCKa7lhUBNtH0p9N67WulMkpWLyIiyY+Ao5ZhXMnigXCobic/Xq+t2m1P0qAwBwWueqBClAR4dZ0a2o+XQb2AxYX0olthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXG/6mxW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXG/6mxW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4807867f8f.2;
        Tue, 10 Jun 2025 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586368; x=1750191168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=EXG/6mxWrjOEQMiWVZZPylF/MYjpPrMHvQoymZ0mICZL5y8l98Uu4VA2zHWQAD5s9n
         EFlpk+ya1BU0n3gbMTXwdROtc77bDYRTlhyGknm6CAE1UaAs5FGm6udTbPMa9m9uUl4U
         3wYwRGJIBtoSHxWmrVCF35JuPP68juTBoFRYl8atrjg0QNkoXzHn28y0NYxz4OYplzjK
         pkOsw0BCLj7Nv1quByluX9LlyybogKsaaTEPEU9PeSm/UNYz/Opgh/bShpHcAc2gp0y2
         hlW04fussjjHjV2VjMnFHWm8hk/qtHXhxvPWvCRrprDBvI6mIMyYdJ2oAqE0MmFmlt1Y
         CaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586368; x=1750191168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=iqZVmuQXK2y0rUSVDH5xdiIo+1b7Va7I6r1jfuAs8F4SnHSq8rQeQRBsStiPU6iCxZ
         jxrLjPq8U4qArPKLBSR6LQKvZF7HXHs2swPBsDNmGvfapIompjKEs68bHr4yt6DkjZ3w
         BU56Nw1E25f8XIWFHs/mf2RiNIYuO03rOWt66wSu0VF+OudKPS+ckg8U3bJJzMXJ/l97
         oC5Gqr6NMiKM4Juzt/dQB8WfT5mqVFgiC6UXAEudre2MimKRqR2HKw7dvEv+0/bR8YAx
         E0vvEmBI6ODe0aVza85W4+h1Nf+Yv1nUhJvkiBMRkbrfNsaekTIbYfNG/7P1pkKsXkdr
         w8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/FYLkGfsnrLcTquyFa2l4CWDiD7fhjNFvdrfNkvZG3OtqzfuFf8gJ7ksUdkhWxk6tO8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznwgb2V++fPxaHOfWWftzTcN9xC8Sgef+yPqqrLtJEV0n2kAfV
	MrPSr1Hq6xb0m1dKUpsZFxf/N9y5IDhunaY/r/4/ktiMspifrIRIuSCWlSKKkHuydfQ=
X-Gm-Gg: ASbGncv/IWfqN3wMcIM9xzNE3YE2RPpziiT9Cs/SdrFoPXbG7xS8F/MLj2qPqTPmqcC
	JVyRq08Pshv9CEUmp6NKMzgdP5nLUbH+4bHpGruKIDQrvDYQvA3WWl6g6U1Vhlt4HL7jTq+N3SL
	+vg6ET0nMq6AdOzI6pD5ucVqq1bdYmjEckRAkQ093zcGWDfhEh/lWWcogPya+o2s1OioKPkhCiy
	JkuZBmxl17npill0g+SLj9cBoWGLdS53qgbSOeHhFXHobq7BQgwpDfbNLzUrv0wwzRyZxDVlk2N
	uFn7tML0Qv1qsNBQT7EQ8LOy05vA25Nhz5bo7HMc6kgS8XzKKxZEK7D+OdmmugS6sHTEg8T7g+k
	=
X-Google-Smtp-Source: AGHT+IGXmvAFjqs4pjoEAShXCvFmqNbo5KEX4EdMZLZduwvdNUPzMRl0S8PE3/LwGX0j1lxRKthagQ==
X-Received: by 2002:a05:6000:288c:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a558a4277cmr315642f8f.54.1749586367885;
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 22:12:18 +0200
Message-ID: <20250610201241.730983-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.49.0

