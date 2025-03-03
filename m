Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D1E1F3BAD
	for <sophgo@lists.linux.dev>; Mon,  3 Mar 2025 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000638; cv=none; b=ajFkC7W63sFGOohvpUk/tCr1gLwqVsWg8q7EeFLIV6Zt/zMDAFk9IUGzpSic75TGgoyxhjtCDRbn5FCOVHuhLP0T8sJqaZi+ShXIJ61y5XHCtEJdAMYHh2UkbS/1+p2f5BsiIGqN/m7uRsxiRWzk+f3uLkcKwZyKrEHVYZWwH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000638; c=relaxed/simple;
	bh=cYRg/UtQ+QTjULJEROcLmWlBc1Hr8j1abFv9RUnzzAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqLYrM/sj+bTgo4V0rrHu7XcG1goPX8E/bfAG/NpLLXiyryD4gLfSY8UsPqaMa4igJ2JxDWFOk//aN8ZLvAYfHC6VjMpxV77ogwsqLZq3QoaQVUTrOa30eEk27Q83hJdbjMygVZ8jZfL66mu2rs3zMOyOrRe5jAVymUH0Qr5xaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG8lXjLs; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG8lXjLs"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd15d03eacso41130526d6.0
        for <sophgo@lists.linux.dev>; Mon, 03 Mar 2025 03:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741000636; x=1741605436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eB+LhY6NNcyLq6FCMk8O4Y073ty4L6CdzDqfsuEgpeY=;
        b=XG8lXjLsVwSyxeyiRpTJQ31ypQuwSjnnY/R77X/N+5QdnUuPEVnQxwD46ZdaUhkEj/
         pefQHXj/012UtloGzQdPUiKreduAHQ7BXTrdgBMJaZe6tRuAWI1Hs/grzPUr9Ycm9z5s
         jdfF6ynu/seSk17wDGL0qkh7+3J7atT4LG2HUWTZHyiOIXn9XR5HlDED5dPQMrhHIv4I
         zk+Ucu//P8UJegOaorCG2CnPa2dg1FeOD7uefxRk4qshN01hUqSDSFT7NdaPezBDFhhR
         covP4rbwOzDteBE7znBYgzVlrz7wOhtFRXX2B4XM8raw4r72pfrkHFyskj+tKwcy/h7I
         YLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000636; x=1741605436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB+LhY6NNcyLq6FCMk8O4Y073ty4L6CdzDqfsuEgpeY=;
        b=Qum5vXBLsEuQTVCBNzRNhhkAz5NRb6BW0yYaH0zQHcPxvYNuE6V8u+VwZRCtoVBKJc
         U//JkyZEE1gahzcjr94xSa4dZlKRNMRzx8Eh9t/G6dply8JnkKa7YsmcqU9pUQPHbjri
         +ZqsdUL7FXoYQSVSM1t96tTnwcSzY9P5bPB9fGOTxKaSid3BFf4kTs2q/qeOabcxyI9C
         QO8/CH6ypXof4wrioYx/BDce7XO13rlYSbsetepvFIHaLC1MLC86LQkYB8p0n6sCUcu3
         SjQCvHNaJXaTkZ3akhbwumQBnqWqM4jXy3b/eY7V89TkLj1QFSauV78yrQY53eiSQ+Yb
         KaMA==
X-Forwarded-Encrypted: i=1; AJvYcCVRVOZlKHd8XwTyiJl8Ax3xvdQz7tURMyFPUV0o+7vP2kLKEFNUzMk2hOw+OCZSUruMXixs0M8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlK0xI+lv1emicgDV4loFl5KgF7XyUehkKdBzYDoyuWJni1gL8
	fmny4rZkdQj3lenA5vdWf6JQzc2OqGgTlwFSABRRnFp7q5g+9PpP
X-Gm-Gg: ASbGnctYF7oWO09LPMNyheiCAk+BGmM2rg119m8x2+Y2ctfqlth+fdUSUR4VwDrn62I
	rTh0RXJPzSFPpw/86t0UdcZMBxuD2exDZjsBEf9KNCTzk/gAtKyewLSyualhfLBbL+FkmUs8gpN
	ilr9jK4pzruZYogLFvNnYgDBVcLlsa5CA4x/3FhEeeCL8DfMJ5Tmdr+r8MFGjaeFh4XwkhdOuCO
	Lgwsa1UTr9TzxgYyr2O0bFe8ExO1HSGqz5S6GwBxh3zlDLdRibBqTTQwgPabaqwLlB436vMFoy0
	yYGCiRo1xu7tHuKUhE0P
X-Google-Smtp-Source: AGHT+IExxBgO8Ucotj8ysaakDRBJ+gx6CiwxNw3F8tva7qbBLpnfOcN6RBjW/nocidB/DXegCw9ccA==
X-Received: by 2002:ad4:5002:0:b0:6e8:af23:b6f1 with SMTP id 6a1803df08f44-6e8af23b74emr84913546d6.10.1741000636169;
        Mon, 03 Mar 2025 03:17:16 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8972b9aa8sm52127166d6.0.2025.03.03.03.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:17:15 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Mon,  3 Mar 2025 19:16:45 +0800
Message-ID: <20250303111648.1337543-1-inochiama@gmail.com>
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

The patch follows Chen Wang's patch for SG2042 MSI controller [1],
which is already merged into for-next.

[1]: https://lore.kernel.org/all/cover.1740535748.git.unicorn_wang@outlook.com/

Inochi Amaoto (2):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
  irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller

 .../sophgo,sg2042-msi.yaml                    |  4 +-
 drivers/irqchip/irq-sg2042-msi.c              | 86 ++++++++++++++++++-
 2 files changed, 85 insertions(+), 5 deletions(-)

--
2.48.1

