Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B42E040A
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538103; cv=none; b=uvAL1aPUhKlipSesGED0Sfkm5tQEaB7h/uUicYCipS3bpjAyV52M0Odo8t3Jf4ynthwW+N5YiIMnXxB2b7WByg+9G983Bd8IKcmapyX4mAyLrCwHxbKsjCf7AapZokPFMKmfJ1k+NnQkFxa9Y7YV4yL9sxWRttF/KFRKrAtfxkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538103; c=relaxed/simple;
	bh=FGoJPVfwutBWJwGj9qB2xybMR3b6ZeRVmlw88KOQWHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCzPEHhpO64DPkL1DApRJpoV7U8Zw3Qwtjhm9fmVhb31V5o2YCautfwUhkqxgsWYXw7PPlGFCewvV6LWgBY8y1CIAbhGxLKr6hAMKHPnJG68zGFUhttDOO5Tu4QR1gsrb9d5BYpD4y9DB+RPCMMUPxnhrU5PX57HV3QaAJx1AFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix6Sq6Lf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix6Sq6Lf"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747c2cc3419so7203283b3a.2
        for <sophgo@lists.linux.dev>; Thu, 03 Jul 2025 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538102; x=1752142902; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=ix6Sq6LffcqOdNbRCshXz2tXEfU1STUQuxsx+od9RgiUAFRL774yr9le9iKkb4u/dV
         q6T08PLTEz3GS+KLFVAdtxuGdeAebrfRVZLI5gmj/uaAxagFkDMBAcPDG2ue7zaklkQ9
         R6YjtLQEzxUyCT525TnAiw6ACQuGTrbsZRfGY7xWJUXKiaoylWr2H9uqfNz4r4GnkQyE
         zkQuKPCNRN3IvVqiSoJoKc9VilhF7HSIHqUFvCHUx6yxRS1TUNThT8EFKQ2itPyam285
         m8aHJZM0gUiu8ojkdhaYlNoiOsdmKgeXbnZJYli8Uj4aAFVb5qotljWUHXtrBxQ638DL
         7qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538102; x=1752142902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf3OnllIKy74CmmPzQiN5iB51QA0QlwijmOja/0ll0Q=;
        b=SGGRzsoLwcEDyS9jEtZmlk0ckdLrexx5nKLSOVyaMhOdnIeCpHGNPJeW6A2t0WGGfu
         1xkyM1XI3dzm8mRbXKnskfquWpeEsx8BfNZ+InyUZo4kjDa4JRrozsC02puNR7Osn1Nh
         xQKYcxNm82Mp/0HiC4sKqGqPbOY97V1JnqYddzXWiGqUL5msVjhhn9IUIzQw2IhJz+Tj
         /DJM2PZMSKmpArsrbiyxzVxfHwG936fEmBvvI1J9YhTDSzMNexg+35/ZiV3HzKUqNtdZ
         LPW5QfxhTq2k9ILBwvrTqVvBfAsXJ2fUXqZAFeSzvksTHrkkkQLMTW8daVxY48AAtk25
         Hwhg==
X-Forwarded-Encrypted: i=1; AJvYcCUmumzc4N+j7eUnx2whi1a1RsvPGY1VJFtZGsON5KrVQKzmRFE6KecJlNMhwXD7Pn1QGbuOdQU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwmpSCUSPfS+0HOmNkvtuqR2xv6wNz8QDBBqQ0dtTc9Gyha45b
	zBBqHtWu9Vvd/iIyXXMj/wsAkvVh50ABDJYQfNPUCSC/s+zl9tfEf//e
X-Gm-Gg: ASbGncu1ZLNGSJ1FzQrfPknz8wa793/AlvfAtkq96REj6ME9Brc1moRmTri6POtpn+Z
	P6h/WYwZILtsjqoFzPbVvMdNzZDuixns8DACrkMuQFxHGqCkjrQKeF4/bvKLbCInB+Zx5crg9Gf
	b2MghpOhA+kEHdzwvjk3nzsQZc/LL7S5iV6gFRrpTF+wzM5XZtfD7kQ6WRDdHFGT7BpBe83zUDY
	Sz/M6/NQBNT/gLk9ehbfU6T3plYpbHKEBSJdrPD3eWOussslJsi6I8I2jqi3sjC8Xtg6452FBKm
	ZkNxUlGZVk9aWwwgy9cbrwvYOMUuvTYK6VhCmb3N1IFaIEPKoQUfSWUXqwbodQ==
X-Google-Smtp-Source: AGHT+IGq73HxNPtEVSnp5azdraH+JoXEP6E2e3ILYaUPK7FTlIC70puJ7IGvGTsd2cf9o9WMfsGxwA==
X-Received: by 2002:a05:6a00:3cd2:b0:748:323f:ba21 with SMTP id d2e1a72fcca58-74c997fd590mr3720134b3a.1.1751538101662;
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541b6e5sm15788469b3a.43.2025.07.03.03.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:21:41 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:21:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Question for CV1800 mailbox users series SoC
Message-ID: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As I have seen you take the mailbox driver for CV1800, I wonder
if you have developed the driver for the 8051 core on the CV1800
system? 

Regards,
Inochi
