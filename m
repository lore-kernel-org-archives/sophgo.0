Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D918CC1C
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 02:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212011; cv=none; b=a/YzZ40vTP6wzhORgj2co8Ms3SRXCu3ORbXJSCg/dEUjAC22S3Ub8JSVlcoa4lKe43NIpq4T0VPl2e/xyLnCqMVuI0KDjwIQDXKpHkzsUGb3N6z4AXj4RlkMHdbaw28mIDMpG82ov9UKXj2+ldWDapQtlA/hkVrrwjk7JV05Ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212011; c=relaxed/simple;
	bh=DbIUGT7egbSIgjmzz8mJCssUS5EuZGi8Eo9qvZUKpaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHJml6ZUhpE+7TFkcPHxNYk0jbpjLHMlQTK0la5DkYx82r4as0Gt57uFxDHARx0Kmnc467LMoNDZ1cXS0MRSeGMYUiw3TRqYdU+MEbOv8WazbbrT/2ZteAVp0uPCkbKOPeibOtQf1kpMKI8t2AcXM0wT5wzgnmOtJ7WHwuy2lmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8H76ChW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8H76ChW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363e973db1so2049755ad.0
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 19:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212009; x=1750816809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=Z8H76ChWDpefaA0MvVf+V92cPKGFIQ1AoSRRoWHvQQ/ti32h7dQbBbqAb7FYOdjA2o
         RUuZp6lZTYVC/jBD8jhP6WytHae5aNcFIS1PaC4rPMEtkDI11ghjcrST9uQpZZ7gmrMF
         kZVqXzJXUIqDQT8QF8BI66Qvw6RDqmxYRAi4WcYt9MPNYVnQQqGvE52Vu0l5ns6wEv20
         sPtYTDwISnxDMoZNNAiGweUBVLz7+Kr6J1hlYkKdfxS1acsjrjKOTmHf3wPHZpeqVeV8
         pgkQSEx/7fSe40o8maARoVWw1nIblyC7N9sQe8n3hEV4GqDQW/KTwIMIR3bankFvNnbp
         4G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212009; x=1750816809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js16QE/l3Azxf6OhqJKpRZgtBkDfap0Xs9MrJpn0tP8=;
        b=UjYHv7e0cry5GWPKiE2hAMu0uuW9l5iJuDV9n1s8YTRlLgsXrL85TE0XmyraaFYcvi
         F9cJtHh/myjaMK5z90/QRPTUQiIlNjwUjfI7I1weJNpCBfnC/1yj4POce2QZICmIy60T
         Bearpy6FnBTQvbM7gt94+C/XeYhTXMYJoE+v08aKKgNh4U0Bj6IQ0/KZ52/KRWmFDFuH
         C6rBSzSrRJT9bCZycaEaACFoaNF0KVnqWmgArVMGqF2xFv3h3DEvoUXQpQNiS5a5HZsq
         QQ3rFJLm21ciPCEOloAuOpo5nQXWn9GSzXf+xZ0zOCN123kfyYJct392TkFkttQ2c24E
         5YeA==
X-Forwarded-Encrypted: i=1; AJvYcCXuljF/HZfGHnx0cmjc9sZQdn2ShWqm1txOZNNOHSMPOmylQ2zG7w5N5QINfK8ZZByVa57J+i0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/Nhy1637wX8dhQVmNGrLN4aLGuCUe3+oddb0DYwAb6LLvA5Sw
	Ze7i1oHgkoa1FzVSVOS78dGKNuGkzJJkLlvfK+oa9VyKzbdXkSLeTX9p
X-Gm-Gg: ASbGncuyI+dEJHekPBfHnbiodkTHOnKfFPAlIi/izLcqiub2XtB13EBgSKBQKkuCmDM
	u1jlNPmXq1gsqvRGEolRzXmysYULzrWps7+2rnuvOWbZopQs0PBah0FiCnnlrUxNzUfiKZMrLow
	I8EpK2PAA7xRJwWf1xL0s0fMNuKz1i3i8vxNGXyU2kLJ5B0NI/qfbq5+pxA/lQdgROpY84YaI/x
	L3kHJXlSshuzoZQntWsqi9mAAaTznNI594kewlL4Wza79tYIdFOSjCEh/ue92uTGPAXevZ3DXAX
	wh5p0RffYV31F9cV97zqdCbTV3YYU81pV2DwVtzWv7zLh3D4263ZRDuvrCyRyyVGzGY5rAtc
X-Google-Smtp-Source: AGHT+IGAOQARUloo9z0y3rQubqjj69WyqkCBQjqqpqt5975rY016nm0RO7e1sy0kgIpRtWCQISr0Aw==
X-Received: by 2002:a17:903:228b:b0:234:11e2:f41 with SMTP id d9443c01a7336-237c2046e94mr12186545ad.6.1750212008742;
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c19d0e36sm11494388a91.15.2025.06.17.19.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:08 -0700 (PDT)
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
Subject: [PATCH 0/2] riscv: dts: sophgo: sg2044: add PCIe device node
Date: Wed, 18 Jun 2025 09:58:47 +0800
Message-ID: <20250618015851.272188-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the PCIe driver is merged, add device node of PCIe device and MSI
device for SG2044.

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: add MSI device support for SG2044
  riscv: dts: sophgo: sg2044: add PCIe device support for SG2044

 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  34 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 186 ++++++++++++++++++
 2 files changed, 220 insertions(+)

--
2.49.0

