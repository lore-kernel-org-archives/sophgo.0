Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7E33FE
	for <sophgo@lists.linux.dev>; Tue,  8 Apr 2025 05:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088548; cv=none; b=attKVNFrAFnMZN5/hLQ/Nd6EOPvj4eR5kXL3VoY0wVBoc2FwNn9/CkRo4/j+SCJr+sA0VUhnjaZRui7E5UOYuch2A88wmsEzV6VL4wBjfkKbx4BiEMeopFG2DPRr6mtLNVea6LmagzyTKSfhAyEOcyTsRsQAbJpC2iD/Tn3vaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088548; c=relaxed/simple;
	bh=KM4iNMvKGENubzBlP4oFLFuPGo1+bejKdkpXcDrBbw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvqobeDoc+SOR42Uk7Ql9cSUyALQgcuGW2TfeeOQwuAOBvsuWEI+sog0aj6QeHJK3Bw78wGZZ0pCWGHfUEdMsGeWEmRz9OWR4aQZqlPcaOOn61LryPKzgz48aQqk/NqL/auvv8z7jjG/iFqiMsc0L6t3VrsSl+yNjNE0FmqJ31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4Ymf7i+; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4Ymf7i+"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c07cd527e4so491541785a.3
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088546; x=1744693346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RoF88PRiXIA+X9QRRmiBMpMzS+lQz5HYzbozNYwWM=;
        b=R4Ymf7i+VOWtEmYBvjogoE+OAEFK9F3pf8mMGABsvNqokTtrJRgFdK9aJBXdOPEQFe
         vMpD9d+PJtKWN4NnVO45uHKJcRvberAD1LxHbgkZDSH7Jw5D0TprNCWkn5IlfugMGW7i
         yU5QYrKv11S6w1a1cTQkzCBJ7zx0CDnWUfdx6W68Jo7kcMEnwOSWkNgmvhPTwaev860/
         KtTg9sPQebGCXiac6jHMPhI0tDbt3RSU8jqrNbKl6C651Zi9uS2QPF8RQ86AstpyTgGN
         MIGCx+6koQx6GHE74D61nbL4owa4SPTp7M6uTqqTofiI1NXhFk22wnBxLF5u+Rap5+ZO
         Upyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088546; x=1744693346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7RoF88PRiXIA+X9QRRmiBMpMzS+lQz5HYzbozNYwWM=;
        b=YTpmCezsy1RKXvEcpE9T5dIbEk2Yyebt6eyKZXaIP64KsWr8Qad//U7OS2uM2YIf4D
         WWe1S/WnhrBLuWhsnycflaM0uzP8PcxvJLNDOsA890bgVmBm23yXxaG487ZzxPyChcQn
         wre0AUHBmXrzMXqcMT4Cf1wAgG9UVO8pb1BHvrpnh49HWVftoXwB5TQRWXYW7Hz9fYsi
         xp6C+a8+OQEaWK6EEFiD/qXCBBVoEpQkC/SM/8FmbGGGqYxnLvvZzvUzZXxjFMomPam5
         Tlv3zo1K0qvfHJr2yxT7+yIpWzjlYlTbZvvuG+i2pexLYAj5fKGMtuG4w+47JOud4ZbG
         7qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwpIPyVpLLTj3tQgdE6ZVI7Mu9Ah6xL1UgFqlQHJNfcOPoPu7g5IyCa+0Z8vU3gqtmuMg7zuw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1L0qDLPLEJrPgx54QCLxJSPOqbt3SYSI40gCLHkbiW9dgcFFu
	rk0bkHxGGaZCmDubSvRFhaiVCyRIQP/tofdeP8TEZ1G6ocWUoXzj
X-Gm-Gg: ASbGncvtMRAr1iEEpfeS5P3W7wTXZNTo1wT95T2arLULeiEnozOf9W77zUk4YErMcjp
	hMM3zbbI6JdUL7M+1CR7pQd4mw4haHpgJipjexmYSJGRrv21CY/4iLxcEtANb39WyaIVKK19tcC
	sMlGfJEwqxEyJ93ec0Jzn25x+Z7Je1w6NctUMWjRVFqln/2xXSYWV4S5XdhCmOUgg7UhESf40wZ
	M0rOhhws9cXDl6ZEaR/CuXnKNwJpi/SrGXYsWyrNBKGcqV0I0N2LWHp9/CcMjQk28OovLr0pqfx
	XToMD/lZsqdapMLjR5lK
X-Google-Smtp-Source: AGHT+IFAmQyuLEqKSqUa3zPYlnlVpM+D6CTCY9Gci7d7NscOgG+3f+LABsr60dVnS0EGKdGef2Rzqg==
X-Received: by 2002:a05:6214:c6d:b0:6e1:f40c:b558 with SMTP id 6a1803df08f44-6f01e7f5050mr180369806d6.44.1744088546031;
        Mon, 07 Apr 2025 22:02:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047aa7sm68706526d6.55.2025.04.07.22.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Tue,  8 Apr 2025 13:01:41 +0800
Message-ID: <20250408050147.774987-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like Sophgo SG2042, SG2044 also uses an external interrupt controller
to handle MSI/MSI-X. It supports more interrupt and has a different
msi message address mapping.

Changed from v2:
1. patch 1: separate from patch 2 of v2 for better reviewing
2. patch 2: separate from patch 2 of v2 for better reviewing
3. patch 3: apply Chen'tag

Changed from v1:
- https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com/
1. patch 1: apply Conor's tag
2. patch 1: improve the bindings comments.
3. patch 2: rebased on tips:irq/drivers patch
4. patch 2: remove unused macro "SG2042_MAX_MSI_VECTOR"
5. patch 2: rename generic structure name to match sg204x.
6. patch 2: rename info field name to avoid misunderstanding.

Inochi Amaoto (4):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
  irqchip/sg2042-msi: rename generic function and structure
  irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
  irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller

 .../sophgo,sg2042-msi.yaml                    |   4 +-
 drivers/irqchip/irq-sg2042-msi.c              | 149 ++++++++++++++----
 2 files changed, 119 insertions(+), 34 deletions(-)

--
2.49.0

