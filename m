Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B23EAFA
	for <sophgo@lists.linux.dev>; Fri,  7 Mar 2025 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309616; cv=none; b=vBZkD8Rgw0XFlBy7CRFYIooEivhcY6Rm767MxUIQ0aYWI8G1nN0MDkxDo123DQsgkACWeeGMW1RguSD8u1G1MK69UIhKgInVW2kJk44PmPUc7i6hpi4i+ooBbT6ZU6G/4poFS6G31l3+HqlDBe1CdeoOTl4+YZmZ8TKBjDUeEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309616; c=relaxed/simple;
	bh=XTOd/qM18P4xT2oWgKwRyBTQucEMFv6Q89AV3jPPlG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnSEDbakvzXSlKJ+HX8n6TxI8pkY1fgX4zq0M9zmHvLr+HHrQ2U/aj/d6+VjsdLQA0bXo7O8PSr7oHGpVoM54J5P97jfkBJyxEoUultX7yeV2pCzvHtl2tbXx0kJ6t+Km3agXEjMhc+X5bRkOeULcBs1aP87pwlqwFQZuT+rsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD5MVsGV; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD5MVsGV"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c3b533a683so142222385a.2
        for <sophgo@lists.linux.dev>; Thu, 06 Mar 2025 17:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741309614; x=1741914414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y31B8wAfn3U31ylaKQUOW/SbJJh+BsVLwXk2uIata8=;
        b=aD5MVsGVXVtQfMPx+lWYMdvoXMKh4ndYrQeRBZj1C5xwknlKKtwsH3z5/Mwnwbl7KP
         RmwwxgoLKNZipZKzCP5Wlnad4wQOVtBIyIeeeGjY6dSj1fDdYoYTASf7jUBlWWQtCyaf
         BuIAJNXfrcx1llZWpmjCQR5SCseLArGeEb665z8eWFr6oSX1wOWlB5Z4V/c2JsCpX7vA
         rgPXIvd/3cHN7wjEu5QVfxsfMbW5rn5zhk26R8NxSyhkbr2LEyu9Th4OuXdNWkDmDgW+
         gJ/V5i2KcdjmtHS0Hy0ByTcVJo8oaH2USQdJBq8XzOih30RRfwch0fvEYYYCj75dDT5d
         e9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309614; x=1741914414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Y31B8wAfn3U31ylaKQUOW/SbJJh+BsVLwXk2uIata8=;
        b=v7lAungIWkCM6phTc2FPu9ca3oppS1U6xLYhIQ+4VWFymSqvk3Ci9QtQF2TL/qkwSw
         64CU0Y5hxU3p68vz9qon+MVEKGNDhzSML+O07RQxxVD9fd71fiyVLd7/wiaEIOr+unKl
         fwgUigMftbpsdpuRsbZ+hVZWbV57WM4IwoFc4hZPjqYS2jqQ5mg+6N4+XEgfmNb21RVk
         00vX4L95WWGcKqLM1hufizaWaQZOBDBqG57ki6QJysVWskfSAyOx7FLTVYCYfSry0DA9
         O7ezVTMt37tC3aa4wI6XVLlsPDbTe0kcT4MZNqpz2yzMEriQiLCzi+ozkiTMt/1QtDjb
         4bpg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/YGu2Z8h5WutPWSwp5PCN5xuksoUD8WHZAnu80yZSvcRX5Lpx0irRWV+rF8TDlrdCYyxUhA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpvfHpwNXwHgIOjR1zTgj2HrWuwNVf78Xr+rQkRsn8nbTpbJBj
	wAPC2QscQYpwRjM/5GZQx2WmoCsLYs2y3qEZKQHaLcdGlHOJ6/Qz
X-Gm-Gg: ASbGncuJEggFsMod22lMy2lHXIN0VS+93wdpdqQe+04wTIuf9Fx7Fmjr8u6AveqeE20
	E0VvxZ4Qhgn0Lceu2vg9IUwg4CNWiQBMAkroj0Yf7m1SZ2IbvVwGkCm4eTcHh6QgF4bVyDQ84Kg
	qwG8rOJV33VjQro5HfAurV8Iue4YeshTmKMrVvDjTetlPBmmqae0k4uA4sw9IstsVLm/cF3xYuO
	hyAPKT24gUIw7MI9ZryWMe3uJ+D519zBxcB+OZSI07RKtHJDvQE1v1fXjVoYFFa+WY8rb2NBMGW
	ptFikG/nZtklNuhnDHWo
X-Google-Smtp-Source: AGHT+IE7cBzIFISSeK1KFa606PMHxR87/Uefy8XC3FEGeWg3bknF99yUyg3Mupnh9mYcrzl5yIrlfQ==
X-Received: by 2002:a05:620a:9007:b0:7c3:d3a1:6f43 with SMTP id af79cd13be357-7c4e61de208mr154630785a.57.1741309613859;
        Thu, 06 Mar 2025 17:06:53 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c47d66273bsm60577885a.69.2025.03.06.17.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:06:53 -0800 (PST)
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
Subject: [PATCH v2 0/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Fri,  7 Mar 2025 09:06:45 +0800
Message-ID: <20250307010649.422359-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
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

The patch follows tips:irq/drivers, which contains Chen Wang's
patch for SG2042 MSI controller [1].

[1]: https://lore.kernel.org/all/cover.1740535748.git.unicorn_wang@outlook.com/

Changed from v1:
- https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com/
1. patch 1: apply Conor's tag
2. patch 1: improve the bindings comments.
3. patch 2: rebased on tips:irq/drivers patch
4. patch 2: remove unused macro "SG2042_MAX_MSI_VECTOR"
5. patch 2: rename generic structure name to match sg204x.
6. patch 2: rename info field name to avoid misunderstanding.

Inochi Amaoto (2):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
  irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller

 .../sophgo,sg2042-msi.yaml                    |   4 +-
 drivers/irqchip/irq-sg2042-msi.c              | 124 +++++++++++++++---
 2 files changed, 106 insertions(+), 22 deletions(-)

--
2.48.1

