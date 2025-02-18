Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851881474B8
	for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739844737; cv=none; b=NxlyXNK2x9eDjk8S+XBMd68fuiv0mGflGqElZLW1RDl9aBE7iiJvDh24PkXI+jTrXNjbZgE/zGtI5pOHgWdwfIpWXjp1Wqaq6hZkc+02C+tLGHqBiqfSGReQd8TbA2a0BFWeBioPoF0HUCs1TI7GPz0Tw47RGjKTgVEccG+NRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739844737; c=relaxed/simple;
	bh=fjBYlxbE1h/DOuOc31KToTPqxmYA7HMncRPrxjXgLg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLVNZnS1Se/OrXW5n0B56rgQBv8onVZ9fkGSIW+wJKoVARd+ucCEazpLk+cvB3uV3Q+M4W+bza/r12KCjAeUKx7gbHwik/WLVRkXdvIMZRucHidYXPctVv95hv0HaEgfbxanr9ClnayzjTGiKuNn6dljb4y5ZlOOphf0S0xIa0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXo4u5f+; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXo4u5f+"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd43aa1558so45786206d6.0
        for <sophgo@lists.linux.dev>; Mon, 17 Feb 2025 18:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739844735; x=1740449535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFj7UXaCbYXWJKfATJnfF3oNg/3GMNWA/XopD15wK6g=;
        b=VXo4u5f+DHQcV9iWDWU9cjh4eXSj1cLk3YxDGmQyczGJ57MTcywYgTiyZa8bnbXwqb
         FqbgJH5sZV0sy8P1IsIIbEm92u/fLBLMIncX3hvNz6xIvEzm8bex/Y9VjAwnsyKWG3zB
         KN8VkTcUiHHkmL29Px0AIA4Ssk3utGfwLTgEX4KmxpjH/pvRwdLVgH6raL76ePZV1rbN
         p2r3upMspvnj1md3gtcyUy6IyxSMHmkVHPz17yNcq0VOOkb4Xx6IWffl54RvFLM33cVv
         AVmvgyJPnIfqtSiMYV7YFZJiLioM8vJzalFx9PAje0pRkRhVA7GyklBWgsOoLOCzNieT
         jgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739844735; x=1740449535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFj7UXaCbYXWJKfATJnfF3oNg/3GMNWA/XopD15wK6g=;
        b=BXel06SXOdjBi4vl8yI+1GQqu19IS+vAx/muNiwDYNbktyD+B18UHJwwxpfLKMrI5f
         5q+Yl6+IvOTm0o9s12baJnaPA1Pv6yX2VHKD9jNV8L53TILCrB0BRdEWJRECbJSZhsVD
         ZlbOR1PmtBpRxqcMgB46QmYJtA+GCMwOgGDnDTM/8tDkHbwctrO/srd90dBPaFrebYGM
         t4bc/KpqpG5HxEzkbWNlUjQPxEGaQfcnmcXxRzJrrddLpfRiqxnEDG5WCJfkH2dNUbFk
         sTOxNg7zBPUVHzXrwjDsZCVArxd/vuR92KPOjp9wzhmcnKrmr8xzAjXuGqd+phwMWM0f
         5Qmg==
X-Forwarded-Encrypted: i=1; AJvYcCUr0h7ptmzZ2jD0KaBigGpZJ9DJM0dOXZFUdua/VQStPNx0JvdISgu2kQFuQsBzJfAocJsJJ20=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd98FrVfrQsHXqLedyqB8NQqD+dfSbxMbMt0ivJ3EXrtpeoz5b
	MMq4QIuIyjnyZH2gWrO7D59dPoyZMJsu1iVVqmllWBXhF2uJhkku
X-Gm-Gg: ASbGnct5ljrekNBAbkW//CWReZIYvEIQJ9GXuft+rZt6s+WPyVMGA65MoFWmDZFVSIh
	/+/9zOLKyl0B6QpYQkzDD7Cu+bcPOGD5RTb0G24mg6kj+nxfmTpyr8mvWUk2T3x4re6mhRsurGY
	C7nFdrIRnVzudo2czD5klzS09a/XQHGaYbdoK7zAhCqUoqgmomhxUgH9nFIDHpwJjRiumkopMkq
	m7aEf8KB4LiyUiwiqv++HxnolBpuXmoHX+M5BgIZuShf2ZaBrazKbSE5z9t93Ly1LM=
X-Google-Smtp-Source: AGHT+IG6GhKW9alG2L/dAhy8Vk9gV9ZNg2jhx1jhDY57Z65ue1+h3rnzF/NdR78ODmApaHhRn3CMHw==
X-Received: by 2002:a05:6214:1bcb:b0:6e6:6504:ea64 with SMTP id 6a1803df08f44-6e66ccab3c8mr159240376d6.11.1739844735358;
        Mon, 17 Feb 2025 18:12:15 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e672c1e7f0sm29033026d6.114.2025.02.17.18.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 18:12:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
Date: Tue, 18 Feb 2025 10:12:00 +0800
Message-ID: <173984471557.305421.11394944011706782554.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212022831.244143-1-inochiama@gmail.com>
References: <20250212022831.244143-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 12 Feb 2025 10:28:30 +0800, Inochi Amaoto wrote:
> Add mail list and wiki info for SOPHGO entry. Also change Inochi's
> email as the old one can not be accessed.
> 
> 

Applied to for-next, thanks!

[1/1] MAINTAINERS: update info for SOPHGO DEVICETREES and DRIVERS
      https://github.com/sophgo/linux/commit/8630ed6f2adc2dcc89ac601d27c3fe37a187dfec

Thanks,
Inochi

