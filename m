Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE122A7E9
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629472; cv=none; b=CZVho+HVkV0WdHH2GMyfz4yIyNZaRkxRdYffBbKPLg/mYJe+J7LGNpMN7ZBIe4n0Dn7qCi7+3gWPY5jnHask/tyBC7sJIzmFOxDNOiLY9yGh+O3JFUiyxc9m1n66pRxFK4wYmFcwG/+yWJTFaifxsJYWACu5qKYRpWLOkMdD3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629472; c=relaxed/simple;
	bh=kTkKSzhE3N+5xcKYpvA81X8dq2z+SsYne1oPzkYDPYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7rXMMXW/UPHhfoyPoi1ZBZJ7jHdcOAkrpBrTas8ze0rffjWOA8BwQoxaPqmwSQqGUWBrQcDLOO6sJvITQ7eUMCffeDDFlbqbTWiiz/kP7M4gsb3bjC1vfuZb7YJOFlwYTUD3b3jxtBWr+NbDtF6BUzZ+l6nj0HsPAvB1BglcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTHfr7Bt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTHfr7Bt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a42cb03673so79874361cf.3
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629470; x=1750234270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZZMQxOY3jdiUUlcRVmJEoq9jtCkBekBHkitKdRBzHk=;
        b=FTHfr7Bt0aGGk9WrlFXvRMgMF5xkosjXCuvhJVQcTQ3Nw7LkbqimbOsyFIq7GWmUd3
         jGaL0DOsz9cDK6NcBDrPELihyGzDfg5sT5v+WyQgUVnbjw4SgDTV8GFraB6lSPx33u+k
         aTN3c4+MW8p2/y7TnagQj74nSHkVwNQzSG6ry4R4O/iCebt4OwoJxRAE3dhQKe/5dQ6X
         ysnyeyVUbx1Jp+XiER9TWVhNN1r/KfM6hbHyznQ3eLjg7YiGnneK4NSkNxm2p7XRdQGj
         MHYLJeBVg0TO483MiueguJ8wxsAt58Jf9bAYL9QIitLC6v0trJ0G71Q6b2h1IJYY/mRt
         T5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629470; x=1750234270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZZMQxOY3jdiUUlcRVmJEoq9jtCkBekBHkitKdRBzHk=;
        b=L3zhl55q+3ZEdumfLTKcxSohSQK2tFKbvCc02AR7UOzYeZiynC01xK19F8L0g+hyhd
         AtvabxuxAiWEgEjCHVaC24XUAaVhTo72tikF/7FzRO8S7gcGQQxzNkGNQGt9HXwQ39ow
         pisDsNuECQ0SpXZGT0ftyuOe/INCfvgOixfVN7/HB6IXhgJTHbtbflgttRl2TK53d0/1
         Atg/OKRcDWahdyeoXBXzRh4p5PhUOjOINM/Gk+KvxXp45RYLK9EwM0kBKVh3aU+uKsuC
         Im3IbuvHKO2jJrM0vC15St92oc00yMbYinvxX3X+ajwBI1wCsmqONUWOQ7iADp6nP/TV
         8qow==
X-Forwarded-Encrypted: i=1; AJvYcCWijb0ZlVdgd46+Jux/n7oOhOrFEQCnU56V5j4IG3ku/9ejhbCkIFlxw264Jawm54WoX74BNS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlNtGyEu7MC0dQ4cBUe5PZabFrt8FCKQ36fjhPqS7MvSTLypHL
	4g0uYnqCrIDoWNfLhFvHWNMyQxSX10FVxwd+sAPOJqF/sdM+xqQ4JXwLtEtSKAb/
X-Gm-Gg: ASbGnct/6R7+LE1R2UZ9S82K654mTmoAJRyFNWkPRiYDrhCp1ES0P5aMhpqz9/xLVxK
	8gyIK4yaZ81ylhQHmmQh3OoEnr9loPUxrMkStpOGb7dwfdnp1CtkSdYiH70U6tB+if/6udbfF+R
	8Mf50UOebHHsbLUMnvK0FtW49g0cAmlaLlvsay56Q0TdDYHjxv7qSjV3DApj1GajRZjCIcSJYDF
	sWLiWy6KPqLrrDxAylIFaI71Y/hZKia4DL19I7VCmPhg5IKZlCE0yEhZgeEvafwZOxoEnAOkfYV
	CnzbNAMjp1V1pzUC6t/B9L833IAU/oRwCUkLISQttqIMVpbA
X-Google-Smtp-Source: AGHT+IGZnue+EG+14/hjDiRd+e4Wrn0+S+QrqOcOTcR+sr6Io4g4wyFZ6oXcvJFQ47foHvKNUa181w==
X-Received: by 2002:a05:622a:1f0c:b0:494:959e:26a3 with SMTP id d75a77b69052e-4a713c41a06mr39119801cf.34.1749629470186;
        Wed, 11 Jun 2025 01:11:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6f5c7a22esm57218951cf.54.2025.06.11.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:11:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v14 0/2] riscv: sophgo: add dmamux support for Sophgo CV1800/SG2000 SoCs
Date: Wed, 11 Jun 2025 16:09:57 +0800
Message-ID: <20250611081000.1187374-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the syscon device of CV1800 have a usb phy subdevices. The
binding of the syscon can not be complete without the usb phy
is finished. As a result, the binding of syscon is removed
and will be evolved in its original series after the usb phy
binding is fully explored.

Changed from v13:
1. rebase to v6.16-rc1

Changed from v12:
1. remove syscon header and use local offset instead.
2. add COMPILE_TEST for coverage.

Changed from v11:
1. init all the field of the driver data.

Changed from v10:
1. binding: fixed binding id.

Changed from v9:
1. binding: rename to cv1800b-dmamux.
2. binding: remove the unused formatting.

Changed from v8:
1. change compatible name from cv1800-dmamux to cv1800b-dmamux
2. use guard to simpify spinlock process.

Changed from v7:
1. remove unused variable

Changed from v6:
1. fix copyright time.
2. driver only output mapping info in when debugging.
3. remove dma-master check in the driver init since the binding
always require it.

Changed from v5:
1. remove dead binding header.
2. make "reg" required so the syscon binding can have the same
example node of the dmamux binding.

Changed from v4:
1. remove the syscon binding since it can not be complete (still
lack some subdevices)
2. add reg description for the binding,
3. remove the fixed channel assign for dmamux binding
3. driver adopt to the binding change. Now the driver allocates all the
channel when initing and maps the request chan to the channel dynamicly.

Changed from v3:
1. fix dt-binding address issue.

Changed from v2:
1. add reg property of dmamux node in the binding of patch 2

Changed from v1:
1. fix wrong title of patch 2.

Inochi Amaoto (2):
  dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series
    SoC
  dmaengine: add driver for Sophgo CV18XX/SG200X dmamux

 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   |  51 ++++
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/cv1800b-dmamux.c                  | 259 ++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
 create mode 100644 drivers/dma/cv1800b-dmamux.c

--
2.49.0

