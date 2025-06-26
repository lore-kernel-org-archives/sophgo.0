Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B80C1805E;
	Thu, 26 Jun 2025 00:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750899318; cv=none; b=J4TyLWWcsEUI0sRADGLaFg4oyoPfNTYgaPepD2/wVonpv0mmJItHtllFb2b5+iwDC2QbPi+Oz40E8VZrXx0DJqaKXPMjL+bETxrFA0Ya4THexOab9K/zm49a0njVsc1EkwOT0ohb9L65qQpVWf0K36lfmI/iX7MqKRW9DD3BsDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750899318; c=relaxed/simple;
	bh=zFqd3/bjLRPp+NI2rL3/KcSshFSOhdj8iHHpRSps3Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ar0lIYxSSjwsXYk7TisTGShBzQZ3MZumYy7KjXBQvYZsxzMIGzZSfTCwCHB63Fj7/fCGE+3IjYNhBMJmt+aKY3FW9wetpZEP3r6Ss8vR/ZUqlxn9LjfY57I2/vvvNRAS4Jbi4C01UwOa5fm9qLxpCQWuAIvet4CZPe+2aEDHpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgxlN6z/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgxlN6z/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747c2cc3419so489162b3a.2;
        Wed, 25 Jun 2025 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750899316; x=1751504116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=GgxlN6z/tziwEDbZjVUhSyRsOieRoIqfQq6XS2lN0t+K5oqhNTfdBXHaFRvGop8j2C
         VkjVZShrPFoil+hynLREGk6gsU+c2wH18It570ETgAU/d9sOo9uO80XNkJVxKxroNYxJ
         f7JzmmK5RXfFBxpf+GNCAMIP0wBoAEy6weeQcWi1Kl4pDDijxVqOHbF1LK++FFut9HV1
         4aUK1FQlsN5OJvPNCw3FfFT2UYHymLsSC0MsqNYs848EBzqYGdQmv9NhE2xJhqWVcSv/
         ZqYstlZA36bGGpv+XKjQuV7xiqpi+5A3TazDHk/pCGk5L/E/H/sb6e4+0cOsZclvE3rx
         gusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750899316; x=1751504116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=gp0pM6EQ0JnKeHrttm1FdVEByZtP08couvxJlLYmx9CkgOLvEkwvYgudPjG3akKcql
         oRwXbSBCcUsmxyR3ByqYttCSA8wzX1Tok9BkFWiCEKMYJIf2PZL/cDERUN7i0KrVQBff
         T3465UUYnpIz4akBjwW4fbIiKNtHQqia/zZnxQ8TTZCN9kZDPdUMV+ochnet8L4qRJ7v
         ELlLPifEEqPeNPMqG/RohlrQ/5pHQrgisyFQJD6yvCYvI4n4l9MwxSKeqJk525eRNqQ3
         r+3XcCKYJIOHKwlAQ2KGTNLBLTZ/NNJSwqU4G+vo5CQzMCAncvwewVnh7S8g0knr90S2
         Q8rA==
X-Forwarded-Encrypted: i=1; AJvYcCU9ykceuZeGOmO/pvG+i8VcF//3dj36V4R3q/dFWORy3l/24GpyhSRlPd04oT9SfqxksrY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxmND1nxft2JNP6Er3zvvXTrizJ/h7MUY7p0j6eLiDXWzwMkex
	io1iASaoeSoU2OV++rJeowIK7+zj4VblWF8egCTCM/zYypPq3ioZPMElGf+S2Mhy
X-Gm-Gg: ASbGncv2DCeMcxTM65Ej6jF5Ewm1ehhkiKDExjx7Me3vaQbuCgXwjgf2zNZ31AV3piQ
	QCnghcmsMtzV7RXxQiX4YFXJGlV2UX4E0/iDXJQDkgWTNZn8qKMvpyCWitLvzdU+jMuwzwgH0ND
	D7x4G1XObuiAgVQiP9e0tdKALxmu1RmirfVKCeFy3RTJCn7uo4zrB5pXWUMQJPEvMPmPjCO8OeW
	f2l3Doi5pmUkQdzlZD2ZRSKncLlJp9zi/+Z++Z/gkJXbpRzl/wfL9D9FWC2sEdzqgYa6bEQFEKD
	gXDMkR1bRZ2FmSGQIbvhdLNSM1nSrfLr9XHNFFzhuDb66UVHqrG+TfjBAxulLg==
X-Google-Smtp-Source: AGHT+IEQdAUYETW/gFl9/oAcelA7lj1OlgJJckAOnjGK9HyiGax3+ORLzbkl8qg66/CLNj/A5zHCVA==
X-Received: by 2002:a05:6a00:3e23:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-74ad4462133mr7446024b3a.2.1750899316199;
        Wed, 25 Jun 2025 17:55:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c882cd8fsm5330612b3a.77.2025.06.25.17.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:55:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
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
Subject: Re: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 26 Jun 2025 08:55:03 +0800
Message-ID: <175089922824.136282.4248920975036123392.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 15:28:08 +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> [...]

Applied to for-next, thanks!

[1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
      https://github.com/sophgo/linux/commit/f71cc64dde536e1e805e5b38855d8d3a01eec845
[2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
      https://github.com/sophgo/linux/commit/7846621ce517375537ae2772e54f033a241fe382
[3/6] arm64: dts: sophgo: Add Duo Module 01
      https://github.com/sophgo/linux/commit/7a2f4a250a1129e9d92ed8c43c02f528181df679
[4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
      https://github.com/sophgo/linux/commit/29f4eab1d97c89a0a72793823db287ea6649baf6
[5/6] arm64: Add SOPHGO SOC family Kconfig support
      https://github.com/sophgo/linux/commit/af00cebfbb31190dd0124c431d1baabae456c313
[6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
      https://github.com/sophgo/linux/commit/1793a187e20257c260f520d42611966d6d249f22

Thanks,
Inochi

