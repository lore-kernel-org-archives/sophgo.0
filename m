Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEBA927
	for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584608; cv=none; b=Vp0fGMF+1H63jVhXVAQcm3vhkuONLfomwP+m8HJQhOHBnq7m6voPRyioAhxX59fnSwq/1OCWX8vJNnrMrajN5rDbRRTu2xbpT9D5SI3XjvsQouV+PU7sd9M4rjaLi/kAKgcpU7bN+ysj5NuOCZ817hKfDlS1bCJoUyze4/DEE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584608; c=relaxed/simple;
	bh=gMl3Q9o6fNay6IUF13m/fG8D+5r352toq+BOgndtC6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdiN/V1pUKZGG9JQ6/620+bbstiD6m0LqVqnEnm9jdJTzOharWjE2iUI3oMVSuEfBrbjGY6ZCCETkMcip55dGk41bClbGbgDAAMps00aAxAqrvnd0743X5GXC7mepNymEDYjJOTvIJbliWLQ4xLNEyOYQjtyP/4bIUHGqjZOFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+71M1nA; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+71M1nA"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5c815f8efso360016985a.2
        for <sophgo@lists.linux.dev>; Sun, 13 Apr 2025 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584605; x=1745189405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhh7OQWwMybpKR5qgDcy+ifapxHjJXlMgsmeTJlaQZ4=;
        b=e+71M1nAnbZhtleT6jKMVgxdiZxmum3+6qcUFUvUcKUSjDt2GlKDYQjyIsRKVV1svK
         I9dfbwhhoeeczRLDpwgsZYvwczChWksR/PXJguMKHG56ky3CvoJvlRm1KyR29+3NJOID
         9aaSQK1vY9AluwyYq+EeU9NS3YQJns+l+5yql2cwlJkZTvb/2JKJ3YvUP50VbxcE/wzr
         QZMUZPPnZNqJhIX8327iy1fih16adf3hdeXhx41TV9WiAiqf4I0pBc/9Ikbei+T7jGjd
         2POC84s5VADvI7wJWuq7zM9r0fTawX9HEiEmw/jDmb672WBsuasi+f7ou6hNjJOQJqvJ
         0ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584605; x=1745189405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhh7OQWwMybpKR5qgDcy+ifapxHjJXlMgsmeTJlaQZ4=;
        b=Z3oP5vwvporUIgQZif2dAvex0XMTZRMGtTTmFR1aESJ6E57RDdy4bQSCJMgnO8ZiPl
         1+cs0tjwcJc+9SX/+3e/cnunzuMGxYKNVHojkP8x5wpW+4pwE5KbuHnRSepu5ayiccx1
         3dT5xMJUmCTiRqrSeCwb2WwVeQFWAcslzO9xnK9ciqOJIej1BVQxwzpdxIeyXbTfAOSH
         fdcJwfVbK9TmDwtpI2wDFz+NdQHKeV2kdpb0xXV++7KWOdpfqct0jfEn+1kExlJXekql
         8MaTtd8iSZVQimVEknkLq2m3IPLDhelD1u6QFVGCaueMNlgXHEUwTB+GqthxE2D3Pd6O
         MVvg==
X-Forwarded-Encrypted: i=1; AJvYcCVjwdUpCo/iJuwi888Vo/b9Auc0D4XWAT2Ay2dDEGt1rfCgYNTJceae7vLqn4IWGACDwrjDnnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZVPtVOXfrDjWW9foCSwfcNrE+8QpND4AKIIt0tSzjXnN/+HWE
	FxhUWdE+E6dGcraP/wq/Atu1v020PFg4Y9taFc+TB682HmGvdfBA
X-Gm-Gg: ASbGncuQfwaoFsVJLyOGobgddLos7UcduEVeexyLO0Rzay3Zj+zGNsNqYxZFWs3vvOg
	v0DG/Gf0WKQ2jQYtQUxITl6c84u6oUfGJdV0G9xu/8xlR1D/ULZuasuSghm1tn3rHZn2xR4n+9y
	9i/xR1qPDbt8E686rMdgnDaKnYllusJNJPblOkSzHFdGKLKdZkWFiHp3XfR8HbPNhzsN2Ar+j10
	k+AAzXzRxwHp08jlBWIc/ANEjljV72QLU8NctCfzAVF2ky02uglTncslt+2A+9D3q04BHfRJ71/
	9Din20C1gBE2pk3N
X-Google-Smtp-Source: AGHT+IFohEfgbuD5ksysZW/OXlVS+hYAGf/MLysVgDZw9TxhfZVn8l+weXa/RBcrp4hZUoTNUyrnWg==
X-Received: by 2002:a05:620a:4148:b0:7c5:5801:ea9a with SMTP id af79cd13be357-7c7af0c0f05mr1319345785a.11.1744584605058;
        Sun, 13 Apr 2025 15:50:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a895181csm616987285a.32.2025.04.13.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:04 -0700 (PDT)
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
Subject: [PATCH v4 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Mon, 14 Apr 2025 06:49:11 +0800
Message-ID: <20250413224922.69719-1-inochiama@gmail.com>
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

Changed from v3:
- https://lore.kernel.org/all/20250408050147.774987-1-inochiama@gmail.com/
1. reapply Chen'tag for the whole series
2. patch 3: move msi_map from patch 4 into this one

Changed from v2:
- https://lore.kernel.org/all/20250307010649.422359-1-inochiama@gmail.com/
1. patch 2: separate from patch 2 of v2 for better reviewing
2. patch 3: separate from patch 2 of v2 for better reviewing
3. patch 4: apply Chen'tag

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

